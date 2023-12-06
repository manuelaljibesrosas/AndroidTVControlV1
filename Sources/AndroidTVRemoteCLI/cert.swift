import Foundation
import Security

func shell(_ command: String) -> (output: String?, exitCode: Int32) {
    let task = Process()
    let pipe = Pipe()

    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", command]
    task.launchPath = "/bin/zsh"
    task.launch()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)

    task.waitUntilExit()
    return (output, task.terminationStatus)
}

func createPKCS12File(certPath: String, keyPath: String, pkcs12Path: String) -> Bool {
    if !FileManager.default.fileExists(atPath: keyPath) {
        let privateKeyCommand = "openssl genrsa -out \(keyPath) 2048"
        let privateKeyCommandResult = shell(privateKeyCommand)
        if privateKeyCommandResult.exitCode != 0 {
            print("Failed to generate private key")
            return false
        }
    }

    if !FileManager.default.fileExists(atPath: certPath) {
        let certificateCommand = "openssl req -x509 -new -nodes -key \(keyPath) -sha256 -days 1024 -out \(certPath) -subj \"/CN=androidtvremote\""
        let certificateCommandResult = shell(certificateCommand)
        if certificateCommandResult.exitCode != 0 {
            print("Failed to generate certificate")
            return false
        }
    }

    let command = "openssl pkcs12 -export -in \(certPath) -inkey \(keyPath) -out \(pkcs12Path) -name androidtvremoteidentity -nodes -passout pass:androidtvremote"
    let result = shell(command)

    return result.exitCode == 0
}

func importPKCS12(pkcs12Path: String) -> SecIdentity? {
    guard let pkcs12Data = try? Data(contentsOf: URL(fileURLWithPath: pkcs12Path)) else {
        print("Failed to read PKCS#12 file data")
        return nil
    }

    let options: [String: Any] = [kSecImportExportPassphrase as String: "androidtvremote"]
    var items: CFArray?
    let status = SecPKCS12Import(pkcs12Data as NSData, options as CFDictionary, &items)

    if status == errSecSuccess {
        if let itemsArray = items as? Array<Dictionary<String, Any>>,
           let firstItem = itemsArray.first,
           let identity = firstItem[kSecImportItemIdentity as String] {
            return (identity as! SecIdentity)
        } else {
            print("No identity found in PKCS#12 file")
        }
    } else {
        print("Failed to import PKCS#12 file: \(status)")
        if let error = SecCopyErrorMessageString(status, nil) {
            print("Error description: \(error)")
        }
    }
    return nil
}
