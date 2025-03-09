//
//  Marque+Proxy.swift
//  ChainOfAgents
//
//  Created by Ritesh Pakala on 3/8/25.
//

import Foundation
import MarqueKit


/*func decodeNeatia(_ url: URL) {
    // TODO: Decode prompt
    if let data = try? Data(contentsOf: url) {
        print("{TEST} retrieved data")
        //2. Convert into encrypted data
        guard let array = try? JSONSerialization.jsonObject(with: data, options: []) as? [UInt32] else {
            return
        }
        
        //3. Decrypt data
        if let decoded = configDecode(array) {
            if let data = decoded.data(using: .utf8) {
                
                do {
                    //4. Deserialize into json dictionary representation
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                    
                    //5. Convert to target object
                    if let decodedData = json,
                       let prompt = try? BasicDictionaryDecoder().decode(CustomPrompt.self, from: decodedData) {
                        
                        
                        update(prompt)
                        print("[PS] 4 \(service.commands.contains(prompt.command.value.lowercased()))")
                    }
                } catch let error {
                    print("{TEST} \(error.localizedDescription)")
                }
            }
        }
        
//                        Task.detached {
//                            print("{TEST} searched data")
//
//                            let decoder = JSONDecoder()
//
//                            if let customPrompt = try? decoder.decode(CustomPrompt.self, from: data) {
//
//                                print("{TEST} Decoded and updated custom prompt")
//
//                            }
//                        }

    }
}*/



/*func configDecode(_ bytes: [UInt32]) -> String? {
    let result = MarqueKit().searchBytes(bytes)
    guard let payload = result.payload.components(separatedBy: "<m12>").filter({ $0.isNotEmpty }).first?.components(separatedBy: "</m12>").first else {
        return nil
    }
    
    if let decodedData = Data(base64Encoded: payload),
       let decodedString = String(data: decodedData, encoding: .utf8) {
        return decodedString
    } else {
        return nil
    }
}*/
