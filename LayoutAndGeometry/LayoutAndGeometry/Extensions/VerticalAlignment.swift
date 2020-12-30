//
//  VerticalAlignment.swift
//  LayoutAndGeometry
//
//  Created by denpazakura on 30/12/2020.
//

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}
