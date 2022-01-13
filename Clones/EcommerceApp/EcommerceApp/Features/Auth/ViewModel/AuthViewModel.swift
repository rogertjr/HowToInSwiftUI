//
//  AuthViewModel.swift
//  EcommerceApp
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

final class AuthViewModel: ObservableObject {
    
    // MARK: - Properties
    // Login
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // Register
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    @AppStorage("log_Status") var log_Status: Bool = false
    
    // MARK: - Functions
    func login() {
        withAnimation {
            log_Status = true
        }
    }
    
    func register() {
        withAnimation {
            log_Status = true
        }
    }
    
    func forgotPassword() {}
    
    func clearData() {
        email = ""
        password = ""
        re_Enter_Password = ""
        showPassword = false
        showReEnterPassword = false
    }
}

