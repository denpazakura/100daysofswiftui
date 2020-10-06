//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by denpazakura on 05/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    
    @State private var options = ["rock", "paper", "scissors"]
    @State private var machineMove = Int.random(in: 0...2)
    @State private var presentOptions = false
    @State private var humanShouldWin = true
    @State private var displayResult = false
    
    @State private var currentScore = 0
    @State private var currentRound = 0
    @State private var startButtonText = "Start game"
    @State private var isOptionSelected = true
    
    
    private var moveProcessor = MoveProcessor()
    
    var body: some View {
        
        VStack {
            HStack {
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.moveSelected(number)
                    }) {
                        OptionView(move: Move(rawValue: self.options[number])!)
                            .alert(isPresented: self.$displayResult) { () -> Alert in
                                Alert(title: Text("Game over"), dismissButton: Alert.Button.default(Text("current score: \(self.currentScore)"), action: {
                                    self.currentScore = 0
                                }))
                        }
                    }
                }
            }
            
            Spacer()
                .frame(height: 30)
            
            Button(startButtonText, action: {
                self.startRound()
            })
                .disabled(!isOptionSelected)
                .alert(isPresented: $presentOptions) {
                    
                    Alert(title: Text("Win or Lose?"), primaryButton: Alert.Button.default(Text("Win"), action: {
                        self.humanShouldWin = true
                    }), secondaryButton: Alert.Button.default(Text("Lose"), action: {
                        self.humanShouldWin = false
                    }))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private extension ContentView {
    func startRound() {
        currentRound += 1
        presentOptions = true
        startButtonText = "New round"
        isOptionSelected = false
    }
    
    func moveSelected(_ option: Int) {
        isOptionSelected = true
        guard let move = Move(rawValue: options[option]) else {
            return
        }
        processMove(move)
    }
    
    func processMove(_ humanMove: Move) {
        guard let machineMove = Move(rawValue: options[machineMove]) else {
            return
        }
        
        let humanWin = moveProcessor.winning(move: machineMove)
        
        if humanMove == humanWin && humanShouldWin {
            addPoints()
            print("you lost")
        } else {
            deductPoints()
            print("you lost")
        }
        
        if self.currentRound == 10 {
            self.resetGame()
        }
    }
    
    func addPoints() {
        currentScore += 1
    }
    
    func deductPoints() {
        guard currentScore != 0 else {
            return
        }
        currentScore -= 1
    }
    
    func resetGame() {
        displayResult = true
        startButtonText = "Start game"
        currentRound = 0
        isOptionSelected = true
    }
}
