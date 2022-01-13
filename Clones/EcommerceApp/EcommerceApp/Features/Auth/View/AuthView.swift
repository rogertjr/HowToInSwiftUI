//
//  AuthView.swift
//  EcommerceApp
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

struct AuthView: View {
    // MARK: - Properties
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    
    // MARK: - Layout
    var welcomeView: some View {
        Text("Welcome\nback")
            .font(.custom(customFont, size: 55).bold())
            .foregroundColor(.white)
            .frame(maxWidth: .infinity,alignment: .leading)
            .frame(height: getRect().height / 3.5)
            .padding()
            .background(
                ZStack {
                    LinearGradient(colors: [
                        Color("LoginCircle"),
                        Color("LoginCircle")
                            .opacity(0.8),
                        Color("Purple")
                    ], startPoint: .top, endPoint: .bottom)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .padding(.trailing)
                        .offset(y: -25)
                        .ignoresSafeArea()
                    
                    Circle()
                        .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                        .frame(width: 30, height: 30)
                        .blur(radius: 2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding(30)
                    
                    Circle()
                        .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                        .frame(width: 23, height: 23)
                        .blur(radius: 2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding(.leading,30)
                }
            )
    }
    
    var forgotPasswordButton: some View {
        Button {
            viewModel.forgotPassword()
        } label: {
            Text("Forgot password?")
                .font(.custom(customFont, size: 14))
                .fontWeight(.semibold)
                .foregroundColor(Color("Purple"))
        }
        .padding(.top, 8)
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    var loginRegisterButton: some View {
        Button {
            if viewModel.registerUser{
                viewModel.register()
            } else {
                viewModel.login()
            }
        } label: {
            
            Text("Login")
                .font(.custom(customFont, size: 17).bold())
                .padding(.vertical,20)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color("Purple"))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
        }
        .padding(.top,25)
        .padding(.horizontal)
    }
    
    var toggleFormButton: some View {
        Button {
            withAnimation{
                viewModel.registerUser.toggle()
            }
        } label: {
            Text(viewModel.registerUser ? "Back to login" : "Create account")
                .font(.custom(customFont, size: 14))
                .fontWeight(.semibold)
                .foregroundColor(Color("Purple"))
        }
        .padding(.top,8)
    }
    
    var body: some View {
        VStack {
            welcomeView
            
            ScrollView(.vertical, showsIndicators: false) {
                // Login Page Form....
                VStack(spacing: 15) {
                    Text(viewModel.registerUser ? "Register" : "Login")
                        .font(.custom(customFont, size: 22).bold())
                        .frame(maxWidth: .infinity,alignment: .leading)
                    
                    // Custom Text Field...
                    CustomTextField(
                        icon: "envelope",
                        title: "Email",
                        hint: "justine@gmail.com",
                        value: $viewModel.email,
                        showPassword: .constant(false))
                        .padding(.top, 30)
                    
                    CustomTextField(
                        icon: "lock",
                        title: "Password",
                        hint: "123456",
                        value: $viewModel.password,
                        showPassword: $viewModel.showPassword)
                        .padding(.top, 10)
                    
                    // Regsiter Reenter Password
                    if viewModel.registerUser {
                        CustomTextField(
                            icon: "envelope",
                            title: "Re-Enter Password",
                            hint: "123456",
                            value: $viewModel.re_Enter_Password,
                            showPassword: $viewModel.showReEnterPassword)
                            .padding(.top, 10)
                    }
                    
                    forgotPasswordButton
                    loginRegisterButton
                    toggleFormButton
                }
                .padding(30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Purple"))
        
        // Clearing data when Changes...
        .onChange(of: viewModel.registerUser) { _ in
            viewModel.clearData()
        }
    }
}

// MARK: - PreviewProvider
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
