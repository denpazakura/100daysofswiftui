//
//  FlagImage.swift
//  Flags
//
//  Created by denpazakura on 03/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

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
