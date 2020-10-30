//
//  Result.swift
//  CupcakeCorner
//
//  Created by denpazakura on 30/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
