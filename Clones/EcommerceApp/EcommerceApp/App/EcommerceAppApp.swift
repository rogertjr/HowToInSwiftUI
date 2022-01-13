//
//  EcommerceAppApp.swift
//  EcommerceApp
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

@main
struct EcommerceAppApp: App {
    // MARK: - Propeties
    @AppStorage("log_Status") var log_Status: Bool = false
    
    // MARK: - Layout
    var body: some Scene {
        WindowGroup {
            Group {
                if log_Status {
                    MainView()
                } else {
                    OnboardingView()
                }
            }
        }
    }
}
