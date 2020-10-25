//
//  DataProvider.swift
//  Moonshot
//
//  Created by denpazakura on 24/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import Foundation

struct DataProvider {
    var bundle: Bundle
    
    func missions() -> [Mission] {
        bundle.decode("missions.json")
    }
    
    func astronauts() -> [Astronaut] {
        return bundle.decode("astronauts.json")
    }
    
    
    func crew(for mission: Mission) -> [CrewMember]?{
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts().first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        return matches.isEmpty ? nil : matches
    }
    
    func missions(for astronaut: Astronaut) -> [Mission]? {
        var matches = [Mission]()
        
        for mission in missions() {
            if let _ = mission.crew.first(where: { $0.name == astronaut.id}) {
                matches.append(mission)
            }
        }
        return matches.isEmpty ? nil : matches
    }
}
