//
//  ButtonView.swift
//  FirebaseAuthSwiftUI
//
//  Created by Rogério Toledo on 27/06/21.
//

import SwiftUI

struct ButtonView: View {
    
    // MARK: - Properties
    typealias  ActionHandler = () -> Void
    
    let title: String
    let background: Color
    let foreground: Color
    let border: Color
    let handler: ActionHandler
    
    private let cornerRadius: CGFloat = 10
    
    // MARK: - Init
    internal init(title: String,
                  background: Color = .blue,
                  foreground: Color = .white,
                  border: Color = .clear,
                  handler: @escaping ButtonView.ActionHandler) {
        self.title = title
        self.background = background
        self.foreground = foreground
        self.border = border
        self.handler = handler
    }
    
    // MARK: - Layout
    var body: some View {
        Button(action: handler) {
            Text(title)
                .frame(maxWidth: .infinity,
                       maxHeight: 50)
        }
        .background(background)
        .foregroundColor(foreground)
        .font(.system(size: 16, weight: .bold))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(border, lineWidth: 2)
        )
    }
}

// MARK: - Preview
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonView(title: "Primary") {}
                .preview(with: "Primary Button")
            
            ButtonView(title: "Secondary",
                       background: .clear,
                       foreground: .blue,
                       border: .blue) {}
                .preview(with: "Secondary Button")
        }
    }
}
