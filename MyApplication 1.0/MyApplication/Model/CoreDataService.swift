//
//  CoreDataService.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 31.07.21.
//

import Foundation
import CoreData

class CoreDataService {
    
    //MARK: - Singleton Pattern
    static let defaults = CoreDataService()
    
    
    //MARK: - Context
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    private init() { }
    
    
    //MARK: - Persistent Container
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        
        let container = NSPersistentCloudKitContainer(name: "MyApplication")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    //MARK: - Save Context
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
    
    
    //MARK: - CRUD - Create / Read / Update / Delete
    
    // Create Item
    func createTasks(_title: String, _done: Bool, _isImportent: Bool) -> Tasks {
        let task = Tasks(context: context)
        
        task.title = _title
        task.done = _done
        task.isImportant = _isImportent
        
        saveContext()
        
        return task
    }
    
    // Read Tasks
    func loadTasks() -> [Tasks]? {
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        do {
            let resultArray = try context.fetch(fetchRequest)
            return resultArray
        } catch  {
            print("Error loading data", error.localizedDescription)
        }
        return nil
    }
    
    // Delete Tasks
    func deleteTasks(indexPath: IndexPath, tasksArray: inout [Tasks]) {
        context.delete(tasksArray[indexPath.row])
        tasksArray.remove(at: indexPath.row)
        saveContext()
    }
}
