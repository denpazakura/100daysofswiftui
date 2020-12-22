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

        //save with user defaults
        //if let data = UserDefaults.standard.data(forKey: Self.saveKey) {

        if let data = loadFile() {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }
    }

    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }

    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            //save with user defaults
            //UserDefaults.standard.set(encoded, forKey: Self.saveKey)

            // save in a file
            saveFile(data: encoded)
        }
    }

    private func saveFile(data: Data) {
        let url = getDocumentDirectory().appendingPathComponent(Self.saveKey)

        do {
            try data.write(to: url, options: [.atomicWrite, .completeFileProtection])
        }
        catch let error {
            print("Could not write data: " + error.localizedDescription)
        }
    }

    private func loadFile() -> Data? {
        let url = getDocumentDirectory().appendingPathComponent(Self.saveKey)
        if let data = try? Data(contentsOf: url) {
            return data
        }

        return nil
    }

    private func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

