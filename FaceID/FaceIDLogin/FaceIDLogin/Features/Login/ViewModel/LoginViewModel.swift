//
//  LoginViewModel.swift
//  FaceIDLogin
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI
import Firebase
import LocalAuthentication

final class LoginViewModel: ObservableObject {
    // MARK: - Properties
    @Published var email: String = ""
    @Published var password: String = ""
    
    // FaceID
    @AppStorage("use_face_id") var useFaceID: Bool = false
    @AppStorage("use_face_email") var faceIDEmail: String = ""
    @AppStorage("use_face_password") var faceIDPassword: String = ""
    
    // Log Status
    @AppStorage("log_status") var logStatus: Bool = false
    
    // Error
    @Published var showError: Bool = false
    @Published var errorMsg: String = ""
    
    // MARK: - Functions
    /// Firebase Login
    func loginUser(
        useFaceID: Bool,
        email: String = "",
        password: String = ""
    ) async throws {
        let _ = try await Auth.auth()
            .signIn(withEmail: email != "" ? email : self.email,
                    password: password != "" ? password : self.password)
        
        DispatchQueue.main.async {
            // Stroing only once
            if useFaceID && self.faceIDEmail == "" {
                self.useFaceID = useFaceID
                // Storing for future face ID Login
                self.faceIDEmail = self.email
                self.faceIDPassword = self.password
                print("Stored")
            }
            
            self.logStatus = true
        }
    }
    
    /// FaceID Usage
    func getBioMetricStatus() -> Bool {
        return LAContext().canEvaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            error: .none
        )
    }
    
    /// FaceID Login
    func authenticateUser() async throws {
        let status = try await LAContext().evaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            localizedReason: "To Login Into App"
        )
        
        if status {
            try await loginUser(
                useFaceID: useFaceID,
                email: self.faceIDEmail,
                password: self.faceIDPassword)
        }
    }
}

