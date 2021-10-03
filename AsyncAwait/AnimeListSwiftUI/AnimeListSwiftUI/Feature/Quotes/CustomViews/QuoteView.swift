//
//  QuoteView.swift
//  AnimeListSwiftUI
//
//  Created by Rogério Toledo on 26/09/21.
//

import SwiftUI

struct QuoteView: View {
    // MARK: - Variables
    let item: Quote
    
    // MARK: - Layout
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "tv")
                    .font(.system(size: 12, weight: .black))
                Text(item.anime)
            }
            
            Text(makeAttributedString(title: "Character", label: item.character))
            Text(makeAttributedString(title: "Quotes", label: item.quote))
                .lineLimit(2)
            }
           .padding()
           .foregroundColor(.black)
    }
    
    // MARK: - Functions
    private func makeAttributedString(title: String, label: String) -> AttributedString {
        var string  = AttributedString("\(title): \(label)")
        string.foregroundColor = .black
        string.font = .system(size: 16, weight: .bold)
        
        if let range = string.range(of: label) {
            string[range].foregroundColor = .black.opacity(0.8)
            string[range].font = .system(size: 16, weight: .regular)
        }
        
        return string
    }
}

// MARK: - Preview
struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(item: Quote.with())
    }
}
