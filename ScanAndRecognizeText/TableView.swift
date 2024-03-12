//
//  TableView.swift
//  ScanAndRecognizeText
//
//  Created by Sean Blizard on 3/10/24.
//

import SwiftUI

struct TableView: View {
    var body: some View {
        let tableText = [["A", "Not Detected", "Not Detected"], ["B", "Not Detected", "Not Detected"], ["C", "Not Detected", "Not Detected"], ["D", "Not Detected", "Not Detected"], ["DRB1", "Not Detected", "Not Detected"], ["DRB3/4/5", "Not Detected", "Not Detected"], ["DQB1", "Not Detected", "Not Detected"], ["DQA1", "Not Detected", "Not Detected"], ["DPB1","Not Detected" ,"Not Detected"], ["DPA1", "Not Detected", "Not Detected"]]
        VStack(spacing: 0) {
                    ForEach(0..<10) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<3) { column in
                                Rectangle() // You can replace this with your custom content
                                    .frame(width: 100, height: 50)
                                    .foregroundColor(Color(UIColor.systemIndigo))
                                    .overlay(
                                        Text(tableText[row][column])
                                            .foregroundColor(.white)
                                    )
                            }
                        }
                        .border(Color.black, width: 1) // Add border between rows
                    }
                }
                .border(Color.black, width: 1) // Add border around the entire table
    }
}

struct TableView_Previews: PreviewProvider { // Change #Preview to TableView_Previews
    static var previews: some View {
        TableView()
    }
}
