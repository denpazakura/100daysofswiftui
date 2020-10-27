//
//  ContentView.swift
//  Drawing
//
//  Created by denpazakura on 25/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var insetAmount: CGFloat = 50
    
    @State private var rows = 4
    @State private var columns = 4
    
    @State private var arrowWidth = 0.5
    
    var body: some View {
//        Trapezoid(insetAmount: insetAmount)
//            .frame(width: 200, height: 100)
//            .onTapGesture {
//                withAnimation {
//                    self.insetAmount = CGFloat.random(in: 10...90)
//                }
//        }
        
//
//        Checkerboard(rows: rows, columns: columns)
//            .onTapGesture {
//                withAnimation(.linear(duration: 3)) {
//                    self.rows = 8
//                    self.columns = 16
//                }
//            }
        
        VStack {
            Arrow(width: arrowWidth)
                .frame(width: 40, height: 100)
                .onTapGesture {
                    withAnimation {
                        self.arrowWidth += 0.5
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
