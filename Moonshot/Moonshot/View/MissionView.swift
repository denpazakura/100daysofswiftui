//
//  MissionView.swift
//  Moonshot
//
//  Created by denpazakura on 21/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let astronauts: [CrewMember]
    
    private let dataProvider: DataProvider!
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    GeometryReader { imageGeometry in
                        Image(self.mission.image)
                            .resizable()
                            .scaledToFit()
                            .padding(.top)
                            .frame(width: imageGeometry.size.width, height: imageGeometry.size.height)
                            .scaleEffect(1 - self.imageScaleFactor(geometry: geometry, imageGeometry: imageGeometry))
                            .offset(x: 0, y: self.imageScaleFactor(geometry: geometry, imageGeometry: imageGeometry) * imageGeometry.size.height / 2)

                    }
                    .frame(height: geometry.size.width * 0.75)
                    
                    Text(self.mission.formattedLaunchDate)
                        .padding()
                    
                    Text(self.mission.description)
                        .padding()
                    
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut, astronautMissions: self.dataProvider.missions(for: crewMember.astronaut) ?? [Mission]())) {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
    
    init(mission: Mission, astronauts: [Astronaut], dataProvider: DataProvider) {
        self.mission = mission
        self.dataProvider = dataProvider
        
        self.astronauts = dataProvider.crew(for: mission) ?? [CrewMember]()
    }
}

private extension MissionView {
    func imageScaleFactor(geometry: GeometryProxy, imageGeometry: GeometryProxy) -> CGFloat {
        let imagePosition = imageGeometry.frame(in: .global).minY
        let safeAreaHeight = geometry.safeAreaInsets.top

        return (safeAreaHeight - imagePosition) / 500
        
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts, dataProvider: DataProvider(bundle: Bundle.main))
    }
}
