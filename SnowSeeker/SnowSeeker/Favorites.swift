//
//  Favorites.swift
//  SnowSeeker
//
//  Created by denpazakura on 06/01/2021.
//

import SwiftUI

class Favorites: ObservableObject {
    private var resorts: Set<String> = []

    private let saveKey = "Favorites"

    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode(Set<String>.self, from: data) {
                self.resorts = decodedData
                return
            }
        }
    }

    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        if let encodedData = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
}
