//
//  TextPreviewView.swift
//  ScanAndRecognizeText
//
//  Created by Gabriel Theodoropoulos.
//

import SwiftUI

struct TextPreviewView: View {
    var text: String
    
    var body: some View {
        VStack {
            ScrollView {
                Text(text)
                    .font(.body)
                    .padding()
            }
            Button("Extract Data") {
                let geneticCodeDictionary = extractCodes(input: text)
                let HLA_A = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^A.$")
                let HLA_B = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^B.$")
                let HLA_C = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^C.$")
                let HLA_DRB1 = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^DRB1$")
                let HLA_DQA1 = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^DQA1$")
                let HLA_DQB1 = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^DQB1$")
                let HLA_DPA1 = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^DPA1$")
                print("\(HLA_A), \(HLA_B), \(HLA_C), \(HLA_DRB1), \(HLA_DQA1), \(HLA_DQB1), \(HLA_DPA1)")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(UIColor.systemIndigo))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
        }
    }
}

struct TextPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        TextPreviewView(text: "")
    }
}
