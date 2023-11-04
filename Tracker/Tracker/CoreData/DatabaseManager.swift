//
//  DatabaseManager.swift
//  Tracker
//
//  Created by Ann Goncharova on 22.10.2023.
//

import UIKit
import CoreData

enum DatabaseError: Error {
    case someError
}

final class DatabaseManager {
    
    private let modelName = "Tracker"
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
<<<<<<< HEAD

=======
    
>>>>>>> sprint_17
    private init() {
        _ = persistentContainer
    }
    
    static let shared = DatabaseManager()
    
    // MARK: - Core Data stack
<<<<<<< HEAD

    private lazy var persistentContainer: NSPersistentContainer = {
      
=======
    
    private lazy var persistentContainer: NSPersistentContainer = {
        
>>>>>>> sprint_17
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
<<<<<<< HEAD

    // MARK: - Core Data Saving support

=======
    
    // MARK: - Core Data Saving support
    
>>>>>>> sprint_17
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
<<<<<<< HEAD
  
   
=======
>>>>>>> sprint_17
}
