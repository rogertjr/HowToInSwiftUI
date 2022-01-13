//
//  LoginView.swift
//  FaceIDLogin
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    
    // FaceID
    @State var useFaceID: Bool = false
    
    // MARK: - Layout
    var emailTextField: some View {
        TextField("Email", text: $viewModel.email)
            .padding()
            .background {
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.black.opacity(0.05))
            }
            .textInputAutocapitalization(.never)
            .padding(.top, 20)
    }
    
    var passwordTextField: some View {
        SecureField("Password", text: $viewModel.password)
            .padding()
            .background {
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.black.opacity(0.05))
            }
            .textInputAutocapitalization(.never)
            .padding(.top, 15)
    }
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.5)
                .fill(.black)
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: -90))
                .hLeading()
                .offset(x: -23)
                .padding(.bottom, 30)
            
            Text("Hey,\nLogin Now")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
                .hLeading()
            
            // Textfields
            emailTextField
            passwordTextField
            
            if viewModel.getBioMetricStatus() {
                Group {
                    if viewModel.useFaceID {
                        Button {
                            Task {
                                do { try await viewModel.authenticateUser() }
                                catch {
                                    viewModel.errorMsg = error.localizedDescription
                                    viewModel.showError.toggle()
                                }
                            }
                        } label: {
                            VStack(alignment: .leading, spacing: 10) {
                                Label {
                                    Text("Use FaceID to login into previous account")
                                } icon: {
                                    Image(systemName: "faceid")
                                }
                                .font(.caption)
                                .foregroundColor(.gray)
                                
                                Text("Note: You can turn of it in settings!")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                        }
                        .hLeading()

                    } else {
                        Toggle(isOn: $useFaceID) {
                            Text("Use FaceID to Login")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.vertical,20)
            }
            
            Button {
                Task {
                    do { try await viewModel.loginUser(useFaceID: useFaceID) }
                    catch {
                        viewModel.errorMsg = error.localizedDescription
                        viewModel.showError.toggle()
                    }
                }
            } label: {
                Text("Login")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .hCenter()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.blue)
                    }
            }
            .padding(.vertical, 35)
            .disabled(viewModel.email == "" || viewModel.password == "")
            .opacity(viewModel.email == "" || viewModel.password == "" ? 0.5 : 1)

            NavigationLink {
                HomeView()
            } label: {
                Text("Skip Now")
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 25)
        .padding(.vertical)
        .alert(
            viewModel.errorMsg,
            isPresented: $viewModel.showError
        ) {
            // TODO: implementation
        }
    }
}

// MARK: - PreviewProvider
struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

