//
//  Person.swift
//  FaceNote
//
//  Created by denpazakura on 16/12/2020.
//

import Foundation

struct Person: Identifiable {
    var id = UUID()
    var firstName: String?
    var lastName: String?
    var email: String?
    var imagePath: String?
}
