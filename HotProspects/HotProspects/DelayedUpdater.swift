//
//  DelayedUpdater.swift
//  HotProspects
//
//  Created by denpazakura on 17/12/2020.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
   var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }

    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}
