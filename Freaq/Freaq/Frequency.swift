//
//  FrequencyUnit.swift
//  Freaq
//
//  Created by denpazakura on 29/09/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import Foundation

enum Frequency: String, CaseIterable {
    case terahertz
    case gigahertz
    case megahertz
    case kilohertz
    case hertz
    case millihertz
    case microhertz
    case nanohertz
}

extension Frequency {
    var unit: UnitFrequency {
        switch self {
        case .terahertz: return UnitFrequency.terahertz
        case .gigahertz: return UnitFrequency.gigahertz
        case .megahertz: return UnitFrequency.megahertz
        case .kilohertz: return UnitFrequency.kilohertz
        case .hertz: return UnitFrequency.hertz
        case .millihertz: return UnitFrequency.millihertz
        case .microhertz: return UnitFrequency.microhertz
        case .nanohertz: return UnitFrequency.nanohertz
        }
    }
}

extension Frequency {
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
