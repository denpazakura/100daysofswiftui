//
//  User.swift
//  Friendface
//
//  Created by denpazakura on 12/11/2020.
//

import Foundation

struct User: Decodable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company, email, address, about: String
    let registered: Date
    let tags: [String]
    
    let friends: [Friend]
    
    struct Friend: Decodable {
        let id: String
        let name: String
    }
}
