//
//  ColorProvider.swift
//  iExpense
//
//  Created by denpazakura on 18/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct ColorProvider {
    static func color(for style: Amount) -> Color {
        switch style {
        case .small: return .blue
        case .medium: return .green
        case .large: return .yellow
        }
    }
}
