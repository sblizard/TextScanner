//
//  DataParse.swift
//  ScanAndRecognizeText
//
//  Created by Sean Blizard on 3/7/24.
//

import Foundation


func extractCodes(input: String) -> [String : [Int]] {
    
    var geneticCodes: [String : [Int]] = [:]
    
    let pattern1 = "\\b[A-Z]+\\*\\d{2}\\b"
    
    guard let regex = try? NSRegularExpression(pattern: pattern1) else {
        fatalError("Invalid regular expression pattern")
    }

    regex.enumerateMatches(in: input, range: NSRange(input.startIndex..<input.endIndex, in: input)) { match, _, _ in
        guard let matchRange = match?.range, let range = Range(matchRange, in: input) else { return }
        let code = String(input[range])
        print("Genetic Code: \(code)")
        
        let geneticPrefix: String = String(code.prefix(2))
        
        if geneticCodes[geneticPrefix] != nil{
            geneticCodes[geneticPrefix]?.append(Int(code.suffix(2)) ?? -1)
        }
        else {
            geneticCodes[geneticPrefix] = [Int(code.suffix(2)) ?? -1]
        }
        
    }
    
    let pattern2 = "D(RB|QA|QB|PA)1.\\d{2}"
    
    guard let regex2 = try? NSRegularExpression(pattern: pattern2) else {
        fatalError("Invalid regular expression pattern")
    }

    regex2.enumerateMatches(in: input, range: NSRange(input.startIndex..<input.endIndex, in: input)) { match, _, _ in
        guard let matchRange = match?.range, let range = Range(matchRange, in: input) else { return }
        let code = String(input[range])
        print("Genetic Code: \(code)")
        
        let geneticPrefix: String = String(code.prefix(4))
        
        if geneticCodes[geneticPrefix] != nil{
            geneticCodes[geneticPrefix]?.append(Int(code.suffix(2)) ?? -1)
        }
        else {
            geneticCodes[geneticPrefix] = [Int(code.suffix(2)) ?? -1]
        }
        
    }
    
    print(geneticCodes)
    return geneticCodes
}


func valueForPatternInDictionary(dictionary: [String: [Int]], pattern: String) -> Any {
    guard let regex = try? NSRegularExpression(pattern: pattern) else {
        fatalError("Invalid regular expression pattern")
    }
    
    for key in dictionary.keys {
        if regex.firstMatch(in: key, options: [], range: NSRange(key.startIndex..., in: key)) != nil {
            return dictionary[key]?[0] ?? -1
        }
    }
    
    return -1
}
