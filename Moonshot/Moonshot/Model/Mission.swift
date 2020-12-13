//
//  Mission.swift
//  Moonshot
//
//  Created by denpazakura on 20/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    var launchDateAccessibilityText: String {
        formattedLaunchDate.replacingOccurrences(of: "Date: N/A", with: "Date is not applicable")
    }
    
    func crewAccessibilityText(astronauts: [Astronaut], separator: Character = "\n") -> String {
        crewNames(astronauts: astronauts).replacingOccurrences(of: ".", with: " ")
    }

    func crewNames(astronauts: [Astronaut], separator: Character = "\n") -> String {
        var crewNames = ""

        for member in crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                crewNames += match.name + String(separator)
            }
            else {
                fatalError("Crew member \(member.name) not found")
            }
        }

        return String(crewNames.dropLast())
    }
}
