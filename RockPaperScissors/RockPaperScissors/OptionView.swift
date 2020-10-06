//
//  OptionView.swift
//  RockPaperScissors
//
//  Created by denpazakura on 06/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct OptionView: View {
    var move: Move
    
    var body: some View {
        switch move {
        case .rock: return Text("🗿")
        case .paper: return Text("🗒")
        case .scissors: return Text("✂️")
        }
    }
}
