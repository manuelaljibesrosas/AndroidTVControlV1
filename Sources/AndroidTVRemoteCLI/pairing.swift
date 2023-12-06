import Foundation
import Network
import Dispatch

struct PariringRequest: Codable {
    var serviceName: String
    var clientName: String
    
    enum CodingKeys: String, CodingKey {
        case serviceName = "service_name"
        case clientName = "client_name"
    }
}

struct OptionEncoding: Codable {
    var symbolLength: Int
    var type: Int
    
    enum CodingKeys: String, CodingKey {
        case symbolLength = "symbol_length"
        case type
    }
}

struct OptionsRequest: Codable {
    var outputEncodings: [OptionEncoding]
    var inputEncodings: [OptionEncoding]
    var preferredRole: Int
    
    enum CodingKeys: String, CodingKey {
        case outputEncodings = "output_encodings"
        case inputEncodings = "input_encodings"
        case preferredRole = "preferred_role"
    }
}

struct ConfigurationRequest: Codable {
    var encoding: OptionEncoding
    var clientRole: Int
    
    enum CodingKeys: String, CodingKey {
        case encoding
        case clientRole = "client_role"
    }
}

struct SecretRequest: Codable {
    var secret: String
}

struct Message<T: Codable>: Codable {
    var protocolVersion: Int
    var payload: T
    var type: Int
    var status: Int
    
    enum CodingKeys: String, CodingKey {
        case protocolVersion = "protocol_version"
        case payload
        case type
        case status
    }
}

struct Response: Codable {
    var type: Int
    var status: Int
}

func getSize(of integer: Int) -> Data {
    var bigEndian = integer.bigEndian
    let sizeData = Data(bytes: &bigEndian, count: MemoryLayout<Int>.size)
    return sizeData.subdata(in: (sizeData.count - 4)..<sizeData.count)
}

func enterCode() -> String? {
    print("Enter code: ", terminator: "")
    if let code = readLine() {
        return code
    } else {
        return nil
    }
}

class Pairing {
    var serverPublicKey: SecKey?
    var buffer: Data
    var connection: NWConnection?
    var identity: SecIdentity
    var address: String
    var port: Int
    
    init(address: String, port: Int, identity: SecIdentity) {
        self.buffer = Data(capacity: 512)
        self.address = address
        self.port = port
        self.identity = identity
    }
    
    func send<T: Codable>(message: Message<T>, completion: @escaping (Error?) -> Void) {
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(message)
            
            print(String(data: jsonData, encoding: .utf8)!)
            let sizeData = getSize(of: jsonData.count)
            
            self.connection?.send(content: sizeData, completion: .contentProcessed { error in
                if let error = error {
                    print("Error sending size data: \(error)")
                }
                self.connection?.send(content: jsonData, completion: .contentProcessed { error in
                    if let error = error {
                        print("Error sending data: \(error)")
                    }
                    completion(error)
                })
            })
        } catch {
            completion(error)
        }
    }
    
    func read(completion: @escaping (Response?, Error?) -> Void) {
        self.connection?.receive(minimumIncompleteLength: 1, maximumLength: 512) { [weak self] data, _, _, error in
            guard let self = self else { return }
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            // If data is less than 4 bytes, call read recursively
            if data.count <= 4 {
                self.read(completion: completion)
                return
            }
            
            // Convert the received data to a String and remove leading non-JSON characters
            if var rawDataString = String(data: data, encoding: .utf8) {
                // Remove characters until the string starts with '{' (the beginning of a JSON object)
                while !rawDataString.hasPrefix("{") && !rawDataString.isEmpty {
                    rawDataString.removeFirst()
                }
                
                if let trimmedData = rawDataString.data(using: .utf8) {
                    do {
                        let message = try JSONDecoder().decode(Response.self, from: trimmedData)
                        print("parsed data: \(message)")
                        completion(message, nil)
                    } catch {
                        print("Error decoding response: \(error)")
                        completion(nil, error)
                    }
                } else {
                    print("Failed to convert trimmed string back to data")
                    completion(nil, NSError(domain: "CustomError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert trimmed string back to data"]))
                }
            } else {
                let hexString = data.map { String(format: "%02hhx", $0) }.joined()
                print("Received raw data (non-string format): \(hexString)")
                completion(nil, NSError(domain: "CustomError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Received data is not a valid UTF-8 string"]))
            }
        }
    }
    
    
    func setupConnection(completion: @escaping (Result<Void, Error>) -> Void) {
        let tlsOptions = NWProtocolTLS.Options()
        
        guard let secIdentity = sec_identity_create(self.identity) else {
            completion(.failure(NSError(domain: "CustomError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to create sec_identity"])))
            return
        }
        
        sec_protocol_options_set_local_identity(tlsOptions.securityProtocolOptions, secIdentity)
        sec_protocol_options_set_verify_block(tlsOptions.securityProtocolOptions, { [weak self] _, rawTrust, completionHandler in
            print("verify block")
            
            var error: CFError?
            let trust = sec_trust_copy_ref(rawTrust).takeRetainedValue()
            
            let isTrustValid = SecTrustEvaluateWithError(trust, &error)
            
            if !isTrustValid {
                print("Trust evaluation failed: \(error.map { CFErrorCopyDescription($0) as String } ?? "Unknown error")")
            }

            if #available(OSX 11.0, *) {
                self?.serverPublicKey = SecTrustCopyKey(trust)
            } else {
                self?.serverPublicKey = SecTrustCopyPublicKey(trust)
            }
            
            completionHandler(true)
        }, DispatchQueue.main)
        
        let parameters = NWParameters(tls: tlsOptions)
        parameters.includePeerToPeer = true
        
        let endpoint = NWEndpoint.hostPort(host: NWEndpoint.Host(self.address), port: NWEndpoint.Port(rawValue: UInt16(self.port))!)
        self.connection = NWConnection(to: endpoint, using: parameters)
        
        self.connection?.stateUpdateHandler = { [weak self] newState in
            switch newState {
            case .ready:
                print("Connection is ready")
                if let _ = self?.serverPublicKey {
                    print("Server's public key obtained")
                    completion(.success(()))
                } else {
                    print("Failed to obtain server's public key")
                    completion(.failure(NSError(domain: "CustomError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to obtain server's public key"])))
                }
                
            case .waiting(let error):
                print("Connection is waiting, error: \(error)")
                
            case .failed(let error):
                print("Connection failed, error: \(error)")
                completion(.failure(error))
                
            default:
                print("Connection State: \(newState)")
            }
        }
        
        self.connection?.start(queue: .main)
        
        print("Attempting connection")
    }
    
    func connect(completion: @escaping (Result<Void, Error>) -> Void) {
        setupConnection { result in
            switch result {
            case .success():
                self.sendPairingRequest { result in
                    switch result {
                    case .success():
                        self.sendOptionsRequest { result in
                            switch result {
                            case .success():
                                self.sendConfigurationRequest { result in
                                    switch result {
                                    case .success():
                                        self.sendSecretRequest(completion: completion)
                                    case .failure(let error):
                                        completion(.failure(error))
                                    }
                                }
                            case .failure(let error):
                                completion(.failure(error))
                            }
                        }
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func sendPairingRequest(completion: @escaping (Result<Void, Error>) -> Void) {
        let pairingRequestPayload = PariringRequest(serviceName: "androidtvremote", clientName: "androidtvremote")
        let pairingRequestMessage = Message(protocolVersion: 1, payload: pairingRequestPayload, type: 10, status: 200)

        send(message: pairingRequestMessage) { error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Read the response from the server
            print("Reading server's response")
            self.read { response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let response = response else {
                    completion(.failure(NSError(domain: "PairingError", code: -1, userInfo: [NSLocalizedDescriptionKey: "No response received"])))
                    return
                }
                
                // Check if the response type is as expected (type 11 for successful pairing)
                if response.type == 11 {
                    completion(.success(()))
                } else {
                    completion(.failure(NSError(domain: "PairingError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected response type"])))
                }
            }
        }
    }
    
    private func sendOptionsRequest(completion: @escaping (Result<Void, Error>) -> Void) {
        let optionsRequestPayload = OptionsRequest(
            outputEncodings: [OptionEncoding(symbolLength: 4, type: 3)],
            inputEncodings: [OptionEncoding(symbolLength: 4, type: 3)],
            preferredRole: 1
        )
        let optionsRequestMessage = Message(protocolVersion: 1, payload: optionsRequestPayload, type: 20, status: 200)
        
        // Send the options request message
        send(message: optionsRequestMessage) { error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Read the response from the server
            self.read { response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let response = response else {
                    completion(.failure(NSError(domain: "OptionsError", code: -1, userInfo: [NSLocalizedDescriptionKey: "No response received"])))
                    return
                }
                
                // Check if the response type is as expected (type 20 for successful options request)
                if response.type == 20 {
                    completion(.success(()))
                } else {
                    completion(.failure(NSError(domain: "OptionsError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected response type"])))
                }
            }
        }
    }
    
    private func sendConfigurationRequest(completion: @escaping (Result<Void, Error>) -> Void) {
        let configurationRequestPayload = ConfigurationRequest(
            encoding: OptionEncoding(symbolLength: 4, type: 3),
            clientRole: 1
        )
        let configurationRequestMessage = Message(protocolVersion: 1, payload: configurationRequestPayload, type: 30, status: 200)
        
        // Send the configuration request message
        send(message: configurationRequestMessage) { error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Read the response from the server
            self.read { response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let response = response else {
                    completion(.failure(NSError(domain: "ConfigurationError", code: -1, userInfo: [NSLocalizedDescriptionKey: "No response received"])))
                    return
                }
                
                // Check if the response type is as expected (type 31 for successful configuration request)
                if response.type == 31 {
                    completion(.success(()))
                } else {
                    completion(.failure(NSError(domain: "ConfigurationError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected response type"])))
                }
            }
        }
    }
    
    private func sendSecretRequest(completion: @escaping (Result<Void, Error>) -> Void) {
        let code = enterCode()
        
        if code == nil {
            completion(.failure(NSError(domain: "ConfigurationError", code: -1)))
        }
        
        var certificate: SecCertificate?
        SecIdentityCopyCertificate(self.identity, &certificate)
        let publicKey = SecCertificateCopyKey(certificate!)!
        let publicKeyAttributes = SecKeyCopyAttributes(publicKey)
    }
}
