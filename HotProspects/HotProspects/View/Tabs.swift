//
//  Tabs.swift
//  HotProspects
//
//  Created by denpazakura on 17/12/2020.
//

import SwiftUI

struct Tabs: View {
    static private let tab1Id = "TabOne"
    static private let tab2Id = "TabTwo"
    @State private var selectedTab = Self.tab1Id

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    self.selectedTab = Self.tab2Id
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }
                .tag(Self.tab1Id)
            Text("Tab 2")
                .onTapGesture {
                    self.selectedTab = Self.tab1Id
                }
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Two")
                }
                .tag(Self.tab2Id)
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
