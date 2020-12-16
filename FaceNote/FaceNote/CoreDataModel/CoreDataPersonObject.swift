//
//  CoreDataPersonObject.swift
//  FaceNote
//
//  Created by denazakura on 15/12/2020.
//

import Foundation
import CoreData

class CoreDataPersonObject: ObservableObject {
    private var container: NSPersistentContainer
    
    private var items = [CoreDataPerson]() {
        didSet {
            saveContext()
        }
    }

    @Published private(set) var all = [Person]()

    init(container: NSPersistentContainer = .init(name: "FaceNote")) {
        self.container = container
    }
}
