//
//  WordValidator.swift
//  WordScramble
//
//  Created by denpazakura on 12/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import Foundation
import SwiftUI

enum WordValidationError: LocalizedError {
    case wordNotOriginal
    case wordNotPossible
    case wordNotReal
    case wordTooShort
    case wordIsRoot
}

extension WordValidationError {
    var localizedDescription: String {
        switch self {
        case .wordNotOriginal: return "Word used already"
        case .wordNotPossible: return "Word not recognized"
        case .wordNotReal: return "Word not possible "
        case .wordTooShort: return "This word is too short"
        case .wordIsRoot: return "This word is the same as the start word"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .wordNotOriginal: return "Be more original"
        case .wordNotPossible: return "You can't just make them up, you know!"
        case .wordNotReal: return "That isn't a real word. "
        case .wordTooShort: return "Your answer must contain at least 3 characters"
        case .wordIsRoot: return "Please type another word"
        }
    }
}

protocol WordValidator {
    func isValid(word: String) -> [(Bool, WordValidationError?)]
}

class WordChecker: WordValidator {
    var usedWords = [String]()
    
    private var dictionary: [String]
    private var rootWord: String
    
    private var validators = Array<((Bool, WordValidationError?))>()
    
    init(dictionary: [String], rootWord: String) {
        self.dictionary = dictionary
        self.rootWord = rootWord
    }
    
    
    func setupValidationRules(word: String) {
        validators.append(isNotShort(word: word))
        validators.append(isPossible(word: word))
        validators.append(isReal(word: word))

        validators.append(isOriginal(word: word))
        validators.append(isNotRoot(word: word))
    }
    
    func isValid(word: String) -> [(Bool, WordValidationError?)] {
        setupValidationRules(word: word)
        
        return validators.map { ($0.0, $0.1) }
    }
}

private extension WordChecker {
    func isOriginal(word: String) -> (Bool, WordValidationError?) {
        return !usedWords.contains(word) ? (true, nil) : (false, .wordNotOriginal)
    }
    
    func isPossible(word: String) -> (Bool, WordValidationError?) {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return (false, .wordNotPossible)
            }
        }
        
        return (true, nil)
    }
    
    func isReal(word: String) -> (Bool, WordValidationError?) {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound ? (true, nil) : (true, .wordNotReal)
        
    }
    
    func isNotShort(word: String) -> (Bool, WordValidationError?) {
        return word.count >= 3 ? (true, nil) : (false, .wordTooShort)
    }
    
    func isNotRoot(word: String) -> (Bool, WordValidationError?) {
        return word != rootWord ? (true, nil) : (false, .wordIsRoot)
    }
}
