//
//  ActivityRepository.swift
//  HabitTracker
//
//  Created by denpazakura on 30/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import Foundation

class ActivityRepository: ObservableObject {
    @Published var items = [Activity]()
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Activities") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Activity].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
    
}
