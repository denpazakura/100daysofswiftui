//
//  Activity.swift
//  HabitTracker
//
//  Created by denpazakura on 29/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct Activity: Codable, Identifiable {
    let name: String
    let description: String
    let id = UUID()
    let date: Date?
}

extension Activity {
    var formattedDate: String? {
        if let date = date {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: date)
        } else {
            return nil
        }
    }
}
