//
//  MyTasksApp.swift
//  MyTasks WatchKit Extension
//
//  Created by Rogério Toledo on 14/02/21.
//

import SwiftUI

@main
struct MyTasksApp: App {
    let container = PersistenceController.shared.container
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environment(\.managedObjectContext, container.viewContext)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
