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
        let container = NSPersistentContainer(name: "ToDoList")
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
    
    //MARK: - Delete data functions on bookmarks
    func delete(deleteArticle: ArticleEntity) {
        context.delete(deleteArticle)
        saveContext()
    }
    func delete(deleteHotel: HotelEntity) {
        context.delete(deleteHotel)
        saveContext()
    }
    func delete(deleteFlight: FlightEntity) {
        context.delete(deleteFlight)
        saveContext()
    }
    
    //MARK: - Add data functions on bookmarks
    func addHotelBookmarks(name: String, desc:String, features:String, location:Double, images:String, completion: (HotelEntity) -> Void) {
        let hotel = HotelEntity(context: context)
        hotel.name = name
        hotel.features = features
        hotel.desc = desc
        hotel.location = location
        hotel.images = images
        saveContext()
        completion(hotel)
    }
    func addFlightBookmarks(date: String, features:String, from:String, to:String, images:String, price:String, completion: (FlightEntity) -> Void) {
        let flight = FlightEntity(context: context)
        flight.images = images
        flight.features = features
        flight.from = from
        flight.to = to
        flight.date = date
        flight.price = price
        saveContext()
        completion(flight)
    }
    func addArticleBookmarks(title: String, category:String, images:String, completion: (ArticleEntity) -> Void) {
        let article = ArticleEntity(context: context)
        article.images = images
        article.category = category
        article.title = title
        saveContext()
        completion(article)
    }
}



