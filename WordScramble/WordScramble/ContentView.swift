//
//  ContentView.swift
//  WordScramble
//
//  Created by denpazakura on 09/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var currentScore = 0
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                
                GeometryReader { listProxy in
                    List(self.usedWords, id: \.self) { word in
                        GeometryReader { itemProxy in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                            .frame(width: itemProxy.size.width, alignment: .leading)
                            .offset(x: self.getOffset(listGeometry: listProxy, itemGeometry: itemProxy), y: 0)
                            .accessibilityElement(children: .ignore)
                            .accessibility(label: Text("\(word), \(word.count) letters"))
                        }
                    }
                }
                
            }
            .navigationBarTitle(rootWord)
            .navigationBarItems(leading: Button("Start", action: {
                self.startGame()
            }), trailing: Text("Current  score: \(currentScore)"))
                .onAppear(perform: startGame)
                .alert(isPresented: $showingError) {
                    Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

private extension ContentView {
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        
        let wordChecker = WordChecker(dictionary: usedWords, rootWord: rootWord)
        wordChecker.usedWords = usedWords
        
        let result = wordChecker.isValid(word: answer)
        
        guard let validationError = result.filter({ $0.error != nil }).first?.error else {
            usedWords.insert(answer, at: 0)
            currentScore += answer.count
            newWord = ""
            return
        }
        wordError(title: validationError.localizedDescription, message: validationError.recoverySuggestion ?? "")
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func getOffset(listGeometry: GeometryProxy, itemGeometry: GeometryProxy) -> CGFloat {
        let listHeight = listGeometry.size.height
        let listStart = listGeometry.frame(in: .global).minY
        let itemStart = itemGeometry.frame(in: .global).minY

        let itemPercent =  (itemStart - listStart) / listHeight * 100

        let thresholdPercent: CGFloat = 60
        let indent: CGFloat = 9

        if itemPercent > thresholdPercent {
            return (itemPercent - (thresholdPercent - 1)) * indent
        }

        return 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
