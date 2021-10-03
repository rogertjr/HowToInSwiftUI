//
//  LoginView.swift
//  FirebaseAuthSwiftUI
//
//  Created by Rogério Toledo on 27/06/21.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    @StateObject private var viewModel = LoginViewModel(service: LoginService())
    
    // MARK: - Layout
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 16) {
                InputTextFieldView(text: $viewModel.credentials.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope")
                
                InputPasswordView(password: $viewModel.credentials.password,
                                  placeholder: "Password",
                                  sfSymbol: "lock")
            }
            HStack {
                Spacer()
                Button {
                    showForgotPassword.toggle()
                } label: {
                    Text("Forgot Password?")
                }
                .font(.system(size: 16, weight: .bold))
                .sheet(isPresented: $showForgotPassword) {
                    ForgotPasswordView()
                }
            }
            
            VStack(spacing: 16) {
                ButtonView(title: "Login") {
                    viewModel.login()
                }
                
                ButtonView(title: "Register",
                           background: .clear,
                           foreground: .blue,
                           border: .blue) {
                    showRegistration.toggle()
                }
                .sheet(isPresented: $showRegistration) {
                    RegisterView()
                }
            }
        }
        .padding(.horizontal, 15)
        .navigationTitle("Login")
        .alert(isPresented: $viewModel.hasError) {
            if case .failed(let error) = viewModel.state {
                return Alert(title: Text("Error"),
                             message: Text(error.localizedDescription))
            } else {
                return Alert(title: Text("Error"),
                             message: Text("Something went wrong"))
            }
        }
    }
}

// MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LoginView()
        }
    }
}
