//
//  Card.swift
//  Flashzilla
//
//  Created by denpazakura on 25/12/2020.
//

import Foundation

struct Card: Codable, Identifiable {
    let id = UUID()
    let prompt: String
    let answer: String

    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
