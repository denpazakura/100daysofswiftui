//
//  FriendfaceService.swift
//  Friendface
//
//  Created by denpazakura on 13/11/2020.
//

import Foundation

struct FriendfaceService: DataService {
    var baseURL: String {
        return "https://www.hackingwithswift.com/samples/"
    }
    
    var path: String {
        return "friendface.json"
    }
    
    var parameters: [String: Any]? {
        return [:]
    }
    
    var method: ServiceMethod {
        return .get
    }
}
