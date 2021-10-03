//
//  InputPasswordView.swift
//  FirebaseAuthSwiftUI
//
//  Created by Rogério Toledo on 27/06/21.
//

import SwiftUI

struct InputPasswordView: View {
    
    // MARK: - Properties
    @Binding var password: String
    let placeholder: String
    let sfSymbol: String?
    
    private let textfieldLeading: CGFloat = 30
    
    // MARK: - Layout
    var body: some View {
        SecureField(placeholder, text: $password)
            .frame(maxWidth: .infinity,
                   minHeight: 44)
            .padding(.leading,
                     sfSymbol.isNilOrEmpty
                        ? textfieldLeading / 2
                        : textfieldLeading)
            .background(
                ZStack(alignment: .leading) {
                    if let systemImage  = sfSymbol {
                        Image(systemName: systemImage)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(.gray.opacity(0.5))
                    }
                    RoundedRectangle(cornerRadius: 10,
                                     style: .continuous)
                        .stroke(Color.gray.opacity(0.25))
                }
            )
    }
}

// MARK: - Preview
struct InputPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        InputPasswordView(password: .constant(""),
                          placeholder: "Password",
                          sfSymbol: "lock")
            .preview(with: "Password field with sfsymbol")
    }
}
