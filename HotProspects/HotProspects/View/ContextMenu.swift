//
//  ContextMenu.swift
//  HotProspects
//
//  Created by denpazakura on 18/12/2020.
//

import Foundation
import SwiftUI

struct ContextMenu: View {
    @State private var backgroundColor = Color.red

    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)

            Text("Change color")
                .padding()
                .contextMenu {
                    Button(action: {
                        self.backgroundColor = .red
                    }) {
                        Text("Red")
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.red)
                     }

                Button(action: {
                    self.backgroundColor = .green
                }) {
                    Text("Green")
                }

                Button(action: {
                    self.backgroundColor = .blue
                }) {
                    Text("Blue")
                }
            }
        }
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu()
    }
}
