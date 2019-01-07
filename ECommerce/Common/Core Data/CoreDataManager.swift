//
//  CoreDataStack.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 04/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import UIKit
import CoreData
class CoreDataManager: NSObject {
    // Create SharedInstace of core data stack
    static let sharedManager = CoreDataManager()
    
    private override init() {} // Prevent clients from creating another instance.

    static let moduleName = "ECommerce"

    func SaveMainContext(){
        
        guard managedObjectContext.hasChanges || saveManagedObjectContext.hasChanges else {
            return
        }
        managedObjectContext.performAndWait {
            do{
                try self.managedObjectContext.save()
            }catch{
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Error saving main managed object context! \(nserror), \(nserror.userInfo)")

            }
        }
        saveManagedObjectContext.perform {
            do{
                try self.saveManagedObjectContext.save()
            }catch{
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Error saving main managed object context! \(nserror), \(nserror.userInfo)")

            }
        }

    }
    
    // Loading NSManagedObjectModel
    lazy var managedObjectModel:NSManagedObjectModel = {
        // from app main bundle going look for file called ECommerce with extension momd
//        let modelUrl = Bundle.main.url(forResource: CoreDataManager.moduleName, withExtension:"momd")!
        guard let modelURL = Bundle.main.url(forResource: "ECommerce", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        // Just instantiating ManagedObjectModel with above url
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()

    // helper property to access document directory for the app
    lazy var applicationDocumentDirectory:NSURL = {
        return FileManager.default.urls(for: FileManager.SearchPathDirectory.documentationDirectory , in: FileManager.SearchPathDomainMask.userDomainMask).last!    }() as NSURL

    // here gonna have one persistentStore in this app
    // declaring persistentStore property but can have multiple persistent store
    lazy var persistentStoreCoordinator:NSPersistentStoreCoordinator = {
        // here i have instantiated persistentStoreCoordinator
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel:self.managedObjectModel)
        // from document directory name of module with sqlite
        let persistentStoreURL = self.applicationDocumentDirectory.appendingPathExtension("ECommerce.sqlite")
        // inside error handling here trying to add persistentstore with coordinator
        // which take persistent store take type SQLite
        // url for file if there is no file then it's going to create new one for the app on launch of the app
        // Alos lightwiegth migration automatically and infermapping model automatically
        do{
            try coordinator.addPersistentStore(
                ofType: NSSQLiteStoreType,
               configurationName: nil,
               at: persistentStoreURL,
               options:[NSMigratePersistentStoresAutomaticallyOption:true,
                 NSInferMappingModelAutomaticallyOption:true])
        } catch{
            fatalError("Persistent store error! \(error)")
        }
        // now we have persistent store coordinator with on persitent store
        return coordinator
    }()

    private lazy var saveManagedObjectContext: NSManagedObjectContext = {
        let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        moc.persistentStoreCoordinator = self.persistentStoreCoordinator
        return moc
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.parent = self.saveManagedObjectContext
        return managedObjectContext
    }()

}
