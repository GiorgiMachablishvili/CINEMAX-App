//
//  CoreDataManager.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 02.08.24.
//

import UIKit
import CoreData

class CoreDataManager<T: NSManagedObject> {
  let context: NSManagedObjectContext

  init(context: NSManagedObjectContext = CoreDataStack.shared.context) {
    self.context = context
  }

  func save(_ object: T) {
    do {
      context.insert(object)
      try context.save()
    } catch {
      print(error)
    }
  }

  func fetchAll() -> [T] {
    let request = T.fetchRequest()
    do {
      let result = try context.fetch(request)
      return result as! [T]
    } catch {
      print("Failed to fetch objects: \(error)")
      return []
    }
  }
}

class CoreDataStack {
  static let shared = CoreDataStack()

  private init() {}

  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "CINEMAX_App")
    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        print(error)
      }
    }
    return container
  }()

  var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }

  func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        print(error)
      }
    }
  }
}
