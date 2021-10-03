//
//  HomeView.swift
//  FirebaseAuthSwiftUI
//
//  Created by Rogério Toledo on 27/06/21.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @EnvironmentObject var sessionService: SessionService
    
    // MARK: - Layout
    var body: some View {
        VStack(alignment: .leading,
               spacing: 16) {
            
            VStack(alignment: .leading,
                   spacing: 16) {
                Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A")")
                Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A")")
                Text("Occupation: \(sessionService.userDetails?.occupation ?? "N/A")")
            }
            
            ButtonView(title: "Logout") {
                sessionService.logout()
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("Home")
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
                .environmentObject(SessionService())
        }
    }
}

