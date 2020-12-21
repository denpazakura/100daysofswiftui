//
//  Prospect.swift
//  HotProspects
//
//  Created by denpazakura on 19/12/2020.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var date = Date()
    fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
    static let saveKey = "SavedData"

    @Published private(set) var people: [Prospect]

    init() {
        self.people = []
    }

    func add(_ prospect: Prospect) {
        people.append(prospect)
    }

    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}
