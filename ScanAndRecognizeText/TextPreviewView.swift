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
                let G_HLA_A = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^G_A.$")
                let G_HLA_B = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^G_B.$")
                let G_HLA_C = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^G_C.$")
                let G_HLA_DRB1 = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^G_DRB1$")
                let G_HLA_DQA1 = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^G_DQA1$")
                let G_HLA_DQB1 = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^G_DQB1$")
                let G_HLA_DPA1 = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^G_DPA1$")
                let P_DPA1 = valueForPatternInDictionary(dictionary: geneticCodeDictionary, pattern: "^P_DPA1$")
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
