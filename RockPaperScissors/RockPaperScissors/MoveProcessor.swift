//
//  MoveProcessor.swift
//  RockPaperScissors
//
//  Created by denpazakura on 06/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

struct MoveProcessor {
    func winning(move: Move) -> Move {
        switch move {
        case .rock: return .paper
        case .paper: return .scissors
        case .scissors: return .rock
        }
    }
}
