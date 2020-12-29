//
//  TimerView.swift
//  Flashzilla
//
//  Created by denpazakura on 24/12/2020.
//

import SwiftUI

struct TimerView: View {
    enum Style {
        case variable, fixed
    }

    let timeRemaining: Int
    let style: Style
    let displayLeadingZeros: Bool = true

    var body: some View {
        Group {
            if style == .variable {
                variableStyleTimer()
            }
            else {
                fixedStyleTimer()
            }
        }
    }

    private func variableStyleTimer() -> some View {
        VStack(alignment: .leading) {
            Text("Time: \(timeRemaining)")
            Text("Time: \(String(repeating: "0", count: String(timeRemaining).count))")
                .hidden()
                .frame(height: 0)
        }
    }

    private func fixedStyleTimer() -> some View {
        HStack(spacing: 0) {
            Text("Time: ")
            ForEach(0..<ContentView.maxTimerDigits, id: \.self) { i in
                VStack(alignment: .center) {
                    self.timerDigitText(for: i)
                    Text("0").hidden().frame(height: 0)
                }
            }
        }
    }

    private func timerDigitText(for position: Int) -> Text {
        let stringTimeRemaining = Array(String(timeRemaining))

        let index = position - (ContentView.maxTimerDigits - stringTimeRemaining.count)

        if index >= 0 {
            return Text(String(stringTimeRemaining[index]))
        }

        if displayLeadingZeros {
            return Text("0").foregroundColor(Color.white.opacity(0.2))
        }

        return Text("")
    }
}
