//
//  CoreDataPerson+CoreDataProperties.swift
//  FaceNote
//
//  Created by denpazakura on 14/12/2020.
//
//

import Foundation
import CoreData


extension CoreDataPerson {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataPerson> {
        return NSFetchRequest<CoreDataPerson>(entityName: "CoreDataPerson")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var imagePath: String?

}

extension CoreDataPerson : Identifiable {

}
