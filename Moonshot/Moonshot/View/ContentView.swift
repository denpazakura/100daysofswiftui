//
//  ContentView.swift
//  Moonshot
//
//  Created by denpazakura on 19/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var dataProvider: DataProvider!
    
    var body: some View {
        NavigationView {
            List(dataProvider.missions()) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: dataProvider.astronauts(), dataProvider: dataProvider)) {
                    Image(mission.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                            .accessibility(label: Text(""))
                            .accessibility(value: Text(mission.crewAccessibilityText(astronauts: dataProvider.astronauts())))
                    }
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
