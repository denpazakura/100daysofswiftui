//
//  ContentView.swift
//  Edutainment
//
//  Created by denpazakura on 15/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

let buttonColor = Color(red: 218/255.0, green: 221/255.0, blue: 251/255.0)
let backgroundColor = Color(red: 218/255.0, green: 221/255.0, blue: 251/255.0)

struct MultiplicationViewModel {
   @State var firstMultiplier = 0
   @State var secondMultiplier = 0
   @State var correctAnswer = 0
}


struct ContentView: View {
    @State private var currentScore = 0
    @State private var answerIndex = Int.random(in: 0..<2)
    
    var body: some View {
        
        VStack {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                HStack {
                    
                    ForEach(0 ..< 3) { number in
                        
                        if number == self.answerIndex {
                            //TODO: display the correct answer in one of the buttons' label
                        }
                        
                        Button(action: {
                            print("")
                        }, label: {
                            Text("\(Int.random(in: 1..<100))")
                                .foregroundColor(Color.white)
                        })
                            .frame(width: 50, height: 50)
                            .background(buttonColor)
                            .clipShape(Circle())
                    }
                }
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
    func startGame() {
        //TODO: generate a multiplication problem
    }
    
    func calculateScore() {
        //TODO: calculate score
    }
}
