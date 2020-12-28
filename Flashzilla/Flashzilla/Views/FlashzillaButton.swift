//
//  FlashzillaButton.swift
//  Flashzilla
//
//  Created by denpazakura on 28/12/2020.
//

import SwiftUI

struct FlashzillaButton: View {
    let systemImage: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .padding()
                .background(Color.black.opacity(0.7))
                .clipShape(Circle())
        }
        .foregroundColor(.white)
        .font(.largeTitle)
    }
}
