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
                extractCodes(input: text)
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
