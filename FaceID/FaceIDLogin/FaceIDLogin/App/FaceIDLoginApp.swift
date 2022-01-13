//
//  FaceIDLoginApp.swift
//  FaceIDLogin
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI
import Firebase

@main
struct FaceIDLoginApp: App {
    // MARK: - Properties
    @AppStorage("log_status") var logStatus: Bool = false
    
    // MARK: - Intialize Firebase
    init() {
        FirebaseApp.configure()
    }
    
    // MARK: - Layout
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if logStatus {
                    HomeView()
                } else {
                    LoginView()
                        .navigationBarHidden(true)
                }
            }
        }
    }
}
