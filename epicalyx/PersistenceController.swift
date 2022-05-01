//
//  PersistenceController.swift
//  mirc
//
//  Created by Gabriel Gutierrez on 4/24/22.
//

import CoreData

struct PersistenceController {
    // A singleton for the entire app to use
    static let shared = PersistenceController()
    
    // Storage for CoreData
    let container: NSPersistentContainer
    
    
    // An initializer to load CoreData
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Mirc")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // Save the context if changes have been made
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }
}
