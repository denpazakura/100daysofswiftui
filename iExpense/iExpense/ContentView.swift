//
//  ContentView.swift
//  iExpense
//
//  Created by denpazakura on 16/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
   @Published var firstName = "Bilbo"
   @Published var lastName = "Baggins"
}

struct SecondView: View {
    var name: String

    var body: some View {
        Text("Hello, \(name)!")
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    @ObservedObject var user = User()
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@twostraws")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
