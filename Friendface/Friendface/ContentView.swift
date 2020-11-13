//
//  ContentView.swift
//  Friendface
//
//  Created by denpazakura on 12/11/2020.
//

import SwiftUI

struct ContentView: View {
    private let serviceProvider = DataServiceProvider(service: FriendfaceService())
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
