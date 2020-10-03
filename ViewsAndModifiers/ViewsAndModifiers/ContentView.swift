//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by denpazakura on 03/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .titleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private extension View {
    func titleStyle(color: Color = .blue) -> some View {
        self.modifier(ColorTitle(color: color))
    }
}

struct ColorTitle: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 40, weight: .bold, design: . monospaced))
            .foregroundColor(color)
        
    }
}
