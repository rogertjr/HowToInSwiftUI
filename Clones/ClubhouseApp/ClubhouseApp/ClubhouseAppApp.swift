//
//  ClubhouseAppApp.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 05/06/21.
//

import SwiftUI

@main
struct ClubhouseAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(RoomViewModel())
        }
    }
}
