//
//  DataParse.swift
//  ScanAndRecognizeText
//
//  Created by Sean Blizard on 3/7/24.
//

import Foundation


func extractCodes(input: String) -> [String : [Int]] {
    
    var geneticCodes: [String : [Int]] = [:]
    
    
    //Getting genotype values for HLA-A, HLA-B, and HLA-C
    let pattern1 = "\\b[A-Z]+\\*\\d{2}\\b"
    
    guard let regex = try? NSRegularExpression(pattern: pattern1) else {
        fatalError("Invalid regular expression pattern")
    }
    
    regex.enumerateMatches(in: input, range: NSRange(input.startIndex..<input.endIndex, in: input)) { match, _, _ in
        guard let matchRange = match?.range, let range = Range(matchRange, in: input) else { return }
        let code = String(input[range])
        print("Genetic Code: G_\(code)")
        
        let geneticPrefix: String = "G_" + String(code.prefix(2))
        
        if geneticCodes[geneticPrefix] != nil{
            geneticCodes[geneticPrefix]?.append(Int(code.suffix(2)) ?? -1)
        }
        else {
            geneticCodes[geneticPrefix] = [Int(code.suffix(2)) ?? -1]
        }
        
    }
    
    //Getting genotype values for HLA-DRB1, HLA-DQA1, HLA-DQB1, and HLA-DPA1
    let pattern2 = "D(RB|QA|QB|PA)1.\\d{2}"
    
    guard let regex2 = try? NSRegularExpression(pattern: pattern2) else {
        fatalError("Invalid regular expression pattern")
    }
    
    regex2.enumerateMatches(in: input, range: NSRange(input.startIndex..<input.endIndex, in: input)) { match, _, _ in
        guard let matchRange = match?.range, let range = Range(matchRange, in: input) else { return }
        let code = String(input[range])
        print("Genetic Code: G_\(code)")
        
        let geneticPrefix: String = "G_" + String(code.prefix(4))
        
        if geneticCodes[geneticPrefix] != nil{
            geneticCodes[geneticPrefix]?.append(Int(code.suffix(2)) ?? -1)
        }
        else {
            geneticCodes[geneticPrefix] = [Int(code.suffix(2)) ?? -1]
        }
        
    }
    
    //Getting phenotypes values for HLA-A and HLA-B
    let pattern3 = "\\b[A-B]\\d{2}\\b"
    
    guard let regex3 = try? NSRegularExpression(pattern: pattern3) else {
        fatalError("Invalid regular expression pattern")
    }
    
    regex3.enumerateMatches(in: input, range: NSRange(input.startIndex..<input.endIndex, in: input)) { match, _, _ in
        guard let matchRange = match?.range, let range = Range(matchRange, in: input) else { return }
        let code = String(input[range])
        print("Genetic Code: P_\(code)")
        
        let geneticPrefix: String = "P_" + String(code.prefix(1))
        
        if geneticCodes[geneticPrefix] != nil{
            geneticCodes[geneticPrefix]?.append(Int(code.suffix(2)) ?? -1)
        }
        else {
            geneticCodes[geneticPrefix] = [Int(code.suffix(2)) ?? -1]
        }
        
    }
    
    //Getting phenotype values for HLA-DQA1 and HLA-DPA1
    let pattern4 = "D(QA|PA)1d{2}"
    
    guard let regex4 = try? NSRegularExpression(pattern: pattern4) else {
        fatalError("Invalid regular expression pattern")
    }
    
    regex4.enumerateMatches(in: input, range: NSRange(input.startIndex..<input.endIndex, in: input)) { match, _, _ in
        guard let matchRange = match?.range, let range = Range(matchRange, in: input) else { return }
        let code = String(input[range])
        print("Genetic Code: P_\(code)")
        
        let geneticPrefix: String = "P_" + String(code.prefix(3))
        
        if geneticCodes[geneticPrefix] != nil{
            geneticCodes[geneticPrefix]?.append(Int(code.suffix(2)) ?? -1)
        }
        else {
            geneticCodes[geneticPrefix] = [Int(code.suffix(2)) ?? -1]
        }
        
    }
    
    
    //Getting phenotype values for HLA-DRA1 and HLA-DQA1
    let pattern5 = "D(R|Q)\\d"
    
    guard let regex5 = try? NSRegularExpression(pattern: pattern5) else {
        fatalError("Invalid regular expression pattern")
    }
    
    regex5.enumerateMatches(in: input, range: NSRange(input.startIndex..<input.endIndex, in: input)) { match, _, _ in
        guard let matchRange = match?.range, let range = Range(matchRange, in: input) else { return }
        let code = String(input[range])
        print("Genetic Code: P_\(code)")
        
        let geneticPrefix: String = "P_" + String(code.prefix(2))
        
        if geneticCodes[geneticPrefix] != nil{
            geneticCodes[geneticPrefix]?.append(Int(code.suffix(1)) ?? -1)
        }
        else {
            geneticCodes[geneticPrefix] = [Int(code.suffix(1)) ?? -1]
        }
        
    }
    
    //Getting phenotype values for HLA-C and Bw WITH TWO DIGITs AFTER
    let pattern7 = "[C|B]w\\d{2}\\b"
    
    guard let regex7 = try? NSRegularExpression(pattern: pattern7) else {
        fatalError("Invalid regular expression pattern")
    }
    
    regex7.enumerateMatches(in: input, range: NSRange(input.startIndex..<input.endIndex, in: input)) { match, _, _ in
        guard let matchRange = match?.range, let range = Range(matchRange, in: input) else { return }
        let code = String(input[range])
        print("Genetic Code: P_\(code)")
        
        let geneticPrefix: String = "P_" + String(code.prefix(2))
        
        if geneticCodes[geneticPrefix] != nil{
            geneticCodes[geneticPrefix]?.append(Int(code.suffix(2)) ?? -1)
        }
        else {
            geneticCodes[geneticPrefix] = [Int(code.suffix(2)) ?? -1]
        }
        
    }
    
    
    //Getting phenotype values for HLA-C and Bw WITH ONLY ONE DIGIT AFTER
    let pattern6 = "[C|B]w\\d{1}\\b"
    
    guard let regex6 = try? NSRegularExpression(pattern: pattern6) else {
        fatalError("Invalid regular expression pattern")
    }
    
    regex6.enumerateMatches(in: input, range: NSRange(input.startIndex..<input.endIndex, in: input)) { match, _, _ in
        guard let matchRange = match?.range, let range = Range(matchRange, in: input) else { return }
        let code = String(input[range])
        print("Genetic Code: P_\(code)")
        
        let geneticPrefix: String = "P_" + String(code.prefix(2))
        
        if geneticCodes[geneticPrefix] != nil{
            geneticCodes[geneticPrefix]?.append(Int(code.suffix(1)) ?? -1)
        }
        else {
            geneticCodes[geneticPrefix] = [Int(code.suffix(1)) ?? -1]
        }
    }
    
    //Getting phenotype values for HLA-DPB1
    let pattern8 = "EDP\\d{2}"
    
    guard let regex8 = try? NSRegularExpression(pattern: pattern8) else {
        fatalError("Invalid regular expression pattern")
    }
    
    regex8.enumerateMatches(in: input, range: NSRange(input.startIndex..<input.endIndex, in: input)) { match, _, _ in
        guard let matchRange = match?.range, let range = Range(matchRange, in: input) else { return }
        let code = String(input[range])
        print("Genetic Code: P_\(code)")
        
        let geneticPrefix: String = "P_" + String(code.prefix(3))
        
        if geneticCodes[geneticPrefix] != nil{
            geneticCodes[geneticPrefix]?.append(Int(code.suffix(2)) ?? -1)
        }
        else {
            geneticCodes[geneticPrefix] = [Int(code.suffix(2)) ?? -1]
        }
    }
    
    //Getting phenotype values for HLA-DRB1
    let pattern9 = "DRd{1}"
    
    guard let regex9 = try? NSRegularExpression(pattern: pattern9) else {
        fatalError("Invalid regular expression pattern")
    }
    
    regex9.enumerateMatches(in: input, range: NSRange(input.startIndex..<input.endIndex, in: input)) { match, _, _ in
        guard let matchRange = match?.range, let range = Range(matchRange, in: input) else { return }
        let code = String(input[range])
        print("Genetic Code: P_\(code)")
        
        let geneticPrefix: String = "P_" + String(code.prefix(2))
        
        if geneticCodes[geneticPrefix] != nil{
            geneticCodes[geneticPrefix]?.append(Int(code.suffix(1)) ?? -1)
        }
        else {
            geneticCodes[geneticPrefix] = [Int(code.suffix(1)) ?? -1]
        }
    }
    

    
    
    //get the last two indexes of G_DPA1 and set it equal to P_DPA1
    if geneticCodes["G_DPA1"] != nil {
        let GDPA1 = geneticCodes["G_DPA1"]
        if GDPA1?.count == 4 {
            geneticCodes["P_DPA1"] = [GDPA1?[3] ?? -1]
            geneticCodes["G_DPA1"]?.remove(at: 3)
            geneticCodes["P_DPA1"]?.append(GDPA1?[2] ?? -1)
            geneticCodes["G_DPA1"]?.remove(at: 2)
            print("Genetic Code: P_DPA1")
        }
        
    }
    
    print(geneticCodes)
    return geneticCodes
}

//            Key Names
//HLA-A    G✅(G_A*)   P✅(P_A)
//HLA-B    G✅(G_B*)   P✅(P_B)
//HLA-C    G✅(G_C*)   P✅(P_Cw)
//HLA-DRB1 G✅(G_DRB1) P✅(P_DR)
//HLA-DQA1 G✅(G_DQA1) P
//HLA-DPA1 G✅(G_DPA1) P✅(P_DPA1)
//Bw P     N/a         P✅(P_Bw)
//HLA-DQB1 G✅(G_DQB1) P✅(P_DQ)
//HLA-DPB1             P✅(P_EDP)


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
