//
//  Rehab_AIApp.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/2/25.
//

import SwiftUI

@main
struct Rehab_AIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            LogIn()
        }
    }
}
