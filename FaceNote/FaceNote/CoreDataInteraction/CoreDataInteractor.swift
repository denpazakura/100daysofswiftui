//
//  CoreDataInteractor.swift
//  FaceNote
//
//  Created by denpazakura on 16/12/2020.
//

import Foundation
import CoreData

class CoreDataInteractor {
    private let container: NSPersistentContainer
    
    init(container: NSPersistentContainer) {
        self.container = container
    }
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("Something went wrong. Could not save changes")
            }
        }
    }
    
    func loadData(completion: @escaping ([Person]) -> Void) {
        let request: NSFetchRequest<CoreDataPerson> = CoreDataPerson.fetchRequest()
        var items = [Person]()
        do {
            let coreDataItems = try container.viewContext.fetch(request)

            for item in coreDataItems {
                let person = Person(id: item.id ?? UUID(), firstName: item.firstName, lastName: item.lastName, email: item.email, imagePath: item.imagePath)
                items.append(person)
            }
            completion(items)
        } catch {
            print("Could not fetch any items")
        }
    }
}
