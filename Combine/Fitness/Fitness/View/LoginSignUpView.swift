//
//  LoginSignUpView.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import SwiftUI

struct LoginSignUpView: View {
    @ObservedObject var viewModel: LoginSignUpViewModel
    
    var emailTextField: some View {
        TextField(viewModel.emailPlaceholderText, text: $viewModel.email)
            .modifier(TextfieldRoundedStyle())
            .autocapitalization(.none)
    }
    
    var passwordTextField: some View {
        SecureField(viewModel.passwordPlaceholderText, text: $viewModel.password)
            .modifier(TextfieldRoundedStyle())
            .autocapitalization(.none)
    }
    
    var actionButton: some View {
        Button(action: {
            viewModel.tappedActionButton()
        }) {
            Text(viewModel.buttonTitle)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(Color(.systemPink))
        .cornerRadius(16)
        .padding()
        .disabled(!viewModel.isValid)
        .opacity(viewModel.isValid ? 1 : 0.4)
    }
    
    var body: some View {
        VStack{
            Text(viewModel.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(viewModel.subtitle)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color(.systemGray2))
            
            Spacer()
                .frame(height: 50)
            
            emailTextField
            passwordTextField
            actionButton
            
            Spacer()
        }
    }
}
