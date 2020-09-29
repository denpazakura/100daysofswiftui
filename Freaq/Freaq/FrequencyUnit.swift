//
//  FrequencyUnit.swift
//  Freaq
//
//  Created by denpazakura on 29/09/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import Foundation

enum FrequencyUnit: String, CaseIterable {
    case terahertz
    case gigahertz
    case megahertz
    case kilohertz
    case hertz
    case millihertz
    case microhertz
    case nanohertz
}

extension FrequencyUnit {
    var symbol: String {
        switch self {
        case .terahertz: return "THz"
        case .gigahertz: return "GHz"
        case .megahertz: return "MHz"
        case .kilohertz: return "KHz"
        case .hertz: return "Hz"
        case .millihertz: return "mHz"
        case .microhertz: return "µHz"
        case .nanohertz: return "nHz"
        }
    }
}

struct UnitInfoProvider {
    static func frequencyUnits() -> [FrequencyUnit] {
        return FrequencyUnit.allCases
    }
    
    static func inputUnits() -> [Unit] {
        return FrequencyUnit.allCases.compactMap { Unit(symbol: $0.symbol)}
    }
    static func outputUnits() -> [Unit] {
        return FrequencyUnit.allCases.compactMap { Unit(symbol: $0.symbol)}
    }
    
    static func unitSymbols() -> [String] {
        return FrequencyUnit.allCases.compactMap { String($0.symbol) }
    }
    
    static func unitSymbol(with name: String) -> String {
        guard let frequencyUnit = FrequencyUnit(rawValue: name) else {
            return ""
        }
        return frequencyUnit.symbol
    }
}
