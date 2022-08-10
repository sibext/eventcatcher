//
//  Storage.swift
//  eventcatcher
//
//  Created by Валентин Грачев on 10.08.2022.
//

import Foundation
import CoreData

class Storage {

    private static var instance: Storage?

    let mainContext: NSManagedObjectContext
    let eventsContext: NSManagedObjectContext
    private let persistentContainer: NSPersistentContainer

    static func getInstance() -> Storage {
        if instance == nil {
            instance = Storage()
        }
        return instance!
    }

    private init () {
        self.persistentContainer = NSPersistentContainer(name: "eventcatcher")
        let description = persistentContainer.persistentStoreDescriptions.first
        description?.shouldMigrateStoreAutomatically = true
        description?.shouldInferMappingModelAutomatically = true

        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }

        mainContext = self.persistentContainer.viewContext
        mainContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        eventsContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        eventsContext.mergePolicy = NSOverwriteMergePolicy
        eventsContext.parent = mainContext
        eventsContext.automaticallyMergesChangesFromParent = true
    }

    func saveContext (context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
