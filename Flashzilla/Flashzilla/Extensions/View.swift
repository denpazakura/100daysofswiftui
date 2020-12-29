//
//  View.swift
//  Flashzilla
//
//  Created by denpazakura on 29/12/2020.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}
