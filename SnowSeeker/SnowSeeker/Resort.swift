//
//  Resort.swift
//  SnowSeeker
//
//  Created by denpazakura on 05/01/2021.
//

struct Resort: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
}
