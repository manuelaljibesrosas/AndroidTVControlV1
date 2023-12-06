import Foundation

guard let config = parseCommandLineArguments() else {
    exit(0)
}

//let p = Pairing(address: config.ip, port: 6467, identity: config.identity)
//
//p.connect() { result in
//    switch result {
//    case .success():
//        print("Connection successful")
//        // Proceed with further operations after successful connection
//    case .failure(let error):
//        print("Connection failed: \(error)")
//        // Handle the error
//    }
//}

RunLoop.main.run()
