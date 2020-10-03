//
//  TextModifier.swift
//  WeSplit
//
//  Created by denpazakura on 03/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

extension View {
    func titleStyle(color: Color = .red) -> some View {
        self.modifier(ColorTitle(color: color))
    }
}

struct ColorTitle: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
    }
}
