//
//  ProspectsView.swift
//  HotProspects
//
//  Created by denpazakura on 19/12/2020.
//

import SwiftUI

struct ProspectsView: View {
    var body: some View {
        NavigationView {
            Text("People: \(prospects.people.count)")
                .navigationBarTitle("title")
                .navigationBarItems(trailing: Button(action: {
                    let prospect = Prospect()
                    prospect.name = "Paul Hudson"
                    prospect.emailAddress = "paul@hackingwithswift.com"
                    self.prospects.people.append(prospect)
                }) {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
                })
        }    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView()
    }
}
