//
//  CustomTextField.swift
//  EcommerceApp
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

struct CustomTextField: View {
    // MARK: - Properties
    var icon: String
    var title: String
    var hint: String
    var value: Binding<String>
    var showPassword: Binding<Bool>
    
    // MARK: - Layout
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label {
                Text(title)
                    .font(.custom(customFont, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top,2)
            } else {
                TextField(hint, text: value)
                    .padding(.top,2)
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
        }
        .overlay(
            Group {
                if title.contains("Password") {
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(.custom(customFont, size: 13).bold())
                            .foregroundColor(Color("Purple"))
                    })
                    .offset(y: 8)
                }
            }
            ,alignment: .trailing
        )
    }
}
