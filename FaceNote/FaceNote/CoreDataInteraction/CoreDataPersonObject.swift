//
//  CoreDataPersonObject.swift
//  FaceNote
//
//  Created by denazakura on 15/12/2020.
//

import Foundation
import CoreData

class CoreDataPersonObject: ObservableObject {
    private var coreDataInteractor: CoreDataInteractor
    
    private var items = [CoreDataPerson]() {
        didSet {
            saveContext()
        }
    }

    @Published private(set) var all = [Person]()

    init(container: NSPersistentContainer = .init(name: "FaceNote")) {
        self.coreDataInteractor = CoreDataInteractor.init(container: container)
    }
    
    private func saveContext() {
        coreDataInteractor.saveContext()
    }
}
