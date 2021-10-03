//
//  CloseModifier.swift
//  FirebaseAuthSwiftUI
//
//  Created by Rogério Toledo on 27/06/21.
//

import SwiftUI

struct CloseModifier: ViewModifier {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Function
    func body(content: Content) -> some View {
        content
            .toolbar {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            }
    }
}

// MARK: - Extension
extension View {
    func applyClose() -> some View {
        self.modifier(CloseModifier())
    }
}
