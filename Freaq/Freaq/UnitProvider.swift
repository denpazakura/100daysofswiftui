//
//  UnitProvider.swift
//  Freaq
//
//  Created by denpazakura on 30/09/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import Foundation

struct UnitInfoProvider {
    static func frequencyUnits() -> [Frequency] {
        return Frequency.allCases
    }
    
    static func inputUnits() -> [Unit] {
        return Frequency.allCases.compactMap { Unit(symbol: $0.symbol)}
    }
    static func outputUnits() -> [Unit] {
        return Frequency.allCases.compactMap { Unit(symbol: $0.symbol)}
    }
    
    static func unitSymbols() -> [String] {
        return Frequency.allCases.compactMap { String($0.symbol) }
    }
    
    static func unit(with name: String) -> UnitFrequency? {
        guard let frequencyUnit = Frequency(rawValue: name) else { return nil }
        return frequencyUnit.unit
    }
}
