//
//  AstronautView.swift
//  Moonshot
//
//  Created by denpazakura on 21/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var astronautMissions = [Mission]()
    
    init(astronaut: Astronaut, astronautMissions: [Mission]) {
        self.astronaut = astronaut
        self.astronautMissions = astronautMissions
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Section(header: Text("Missions")) {
                        List(self.astronautMissions) { mission in
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}


struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], astronautMissions: [Mission]())
    }
}
