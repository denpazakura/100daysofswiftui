//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by denpazakura on 09/11/2020.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
