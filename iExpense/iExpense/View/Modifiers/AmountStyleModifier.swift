//
//  AmountStyleModifier.swift
//  iExpense
//
//  Created by denpazakura on 18/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

enum Amount {
    case small
    case medium
    case large
    
    init(amount: Int) {
        if (0...100).contains(amount) {
            self = .small
        }
        else if (100...1000).contains(amount) {
            self = .medium
        }
        else {
            self = .large
        }
    }
}

struct AmountStyleModifier: ViewModifier {
    var expense: Int
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text("\(expense)")
                .font(.headline)
                .foregroundColor(ColorProvider.color(for: Amount.init(amount: expense)))
        }
    }
}

extension View {
    func style(expense: Int) -> some View {
        self.modifier(AmountStyleModifier(expense: expense))
    }
}
