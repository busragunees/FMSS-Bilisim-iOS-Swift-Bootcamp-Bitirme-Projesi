//
//  StoreManager.swift
//  Travely
//
//  Created by Büşra Güneş on 6.10.2022.
//

import Foundation
import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Travely")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext
    
    private init() {
        context = persistentContainer.viewContext
    }
}

extension StorageManager {
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
 
    func fetchDataById<T:NSManagedObject>(entity:T.Type,id:String,completion: (Result<Any?, Error>) -> Void)  {
        let fetchRequest = T.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(
            format: "id == %@", id
        )
        
        do {
            let item = try context.fetch(fetchRequest)
            
            completion(.success(item.first))
        } catch {
            completion(.failure(error))
        }
    }
    
    
    func fetchData<T:NSManagedObject>(entity:T.Type,completion: (Result<[Any], Error>) -> Void)  {
        let fetchRequest = T.fetchRequest()
      
        
        do {
            let list = try context.fetch(fetchRequest)
            
            completion(.success(list))
        } catch {
            completion(.failure(error))
        }
    }
    
    //MARK: - Delete data functions on bookmarks
    func deleteBookmark(entity: TravelEntity, completion:() ->Void) {
        context.delete(entity)
        saveContext()
        completion()
    }

    
    //MARK: - Add data functions on bookmarks
 
    func addBookmark(item:TravelModel, completion: (TravelEntity) -> Void) {
        let entity = TravelEntity(context: context)
        entity.id = item.id
        entity.title = item.title
        entity.desc = item.desc
        entity.category = item.category
        entity.images = item.images
        entity.features = item.features
       // entity.location = item.location
       // entity.price = item.price
        entity.type = item.type
    
        saveContext()
        completion(entity)
    }
}



