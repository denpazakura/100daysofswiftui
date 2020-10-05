//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by denpazakura on 05/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    
    @State private var options = ["Rock", "Paper", "Scissors"]
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var presentOptions = false
    
    @State private var humanShouldWin = true
    
    var body: some View {
        
        Button("Start round", action: {
            self.startRound()
        })
            .alert(isPresented: $presentOptions) {
                
                Alert(title: Text("Win or Lose?"), primaryButton: Alert.Button.default(Text("Win"), action: {
                    self.humanShouldWin = true
                }), secondaryButton: Alert.Button.default(Text("Lose"), action: {
                    self.humanShouldWin = false
                }))
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
        presentOptions = true
    }
}
