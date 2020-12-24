//
//  TimerView.swift
//  Flashzilla
//
//  Created by denpazakura on 24/12/2020.
//

import SwiftUI

struct TimerView: View {
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        @State private var counter = 0

        var body: some View {
            Text("Hello, World!")
                .onReceive(timer) { time in
                    if self.counter == 5 {
                        self.timer.upstream.connect().cancel()
                    } else {
                        print("The time is now \(time)")
                    }

                    self.counter += 1
                }
        }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
