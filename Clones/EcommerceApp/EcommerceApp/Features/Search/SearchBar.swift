//
//  SearchBar.swift
//  EcommerceApp
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

struct SearchBar: View {
    
    // MARK: - Layout
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.gray)
            
            TextField("Search", text: .constant(""))
                .disabled(true)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(
        
            Capsule()
                .strokeBorder(Color.gray,lineWidth: 0.8)
        )
    }
}
