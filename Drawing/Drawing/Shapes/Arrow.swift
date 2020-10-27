//
//  Arrow.swift
//  Drawing
//
//  Created by denpazakura on 27/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct Arrow: Shape {
    var width: Double

    init(width: Double = 0.5) {
        self.width = width
    }

    var animatableData: Double {
        get { width }
        set { width = newValue }
    }

    func path(in rect: CGRect) -> Path {
        let baseHeight = min(rect.size.width / (2 * rect.size.height), 0.5)
        let inset: CGFloat = CGFloat((1 - width) / 2)

        var path = Path()

        path.move(to: CGPoint(x: 0.5, y: 0))
        path.addLine(to: CGPoint(x: 0, y: baseHeight))
        path.addLine(to: CGPoint(x: inset, y: baseHeight))
        path.addLine(to: CGPoint(x: inset, y: 1))
        path.addLine(to: CGPoint(x: 1 - inset, y: 1))
        path.addLine(to: CGPoint(x: 1 - inset, y: baseHeight))
        path.addLine(to: CGPoint(x: 1, y: baseHeight))
        path.closeSubpath()

        return path.applying(CGAffineTransform(scaleX: rect.width, y: rect.height))
    }
}
