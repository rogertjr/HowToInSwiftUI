//
//  LineGraphApp.swift
//  LineGraph
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

@main
struct LineGraphApp: App {
    var body: some Scene {
        WindowGroup {
            ScrollView(
                UIScreen.main.bounds.height < 750 ? .vertical : .init(),
                showsIndicators: false
            ) {
                HomeView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color("BG"))
        }
    }
}
