//
//  ContentView.swift
//  HabitTracker
//
//  Created by denpazakura on 28/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activitiesRepository = ActivityRepository()
    
    @State private var showingAddExpense = false

    var body: some View {
       
        NavigationView {
            List {
               ForEach(activitiesRepository.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Habit Tracker")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddExpense = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddExpense) {
                AddView(activityRepository: self.activitiesRepository)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
