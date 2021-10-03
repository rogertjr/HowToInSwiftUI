//
//  LoadingView.swift
//  AnimeListSwiftUI
//
//  Created by Rogério Toledo on 26/09/21.
//

import SwiftUI

struct LoadingView: View {
    // MARK: - Variables
    let title: String
    
    // MARK: - Layout
    var body: some View {
        VStack(spacing: 8) {
            ProgressView()
            Text(title)
        }
    }
}

// MARK: - Preview
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(title: "Fetching...")
    }
}
