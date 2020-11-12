//
//  User.swift
//  Friendface
//
//  Created by denpazakura on 12/11/2020.
//

import Foundation

struct User: Codable {
    var id: UUID
    var isActive: Bool?
    var name: String
    var age: Int?
    var company: String?
    var email: String?
    var address: String?
    var about: String?
    var registered: Date
    
    var tags: [String]
    var friends: [Friend]
}
