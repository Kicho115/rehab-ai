//
//  CDManager.swift
//  Rehab-AI
//
//  Created by Rafael Negrete Leyva on 06/04/25.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "Exercise")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error al cargar el store: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return container.viewContext
    }

    func save() {
        do {
            try context.save()
        } catch {
            print("Error al guardar: \(error)")
        }
    }
}
