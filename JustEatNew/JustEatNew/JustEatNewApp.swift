//
//  JustEatNewApp.swift
//  JustEatNew
//
//  Created by Shraddha on 15/02/23.
//

import SwiftUI

@main
struct JustEatNewApp: App {
    let persistenceController = PersistenceController.shared
//    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserSettings())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            ProfilePage()
        }
    }
}

