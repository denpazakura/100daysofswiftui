//
//  ManualPublishing.swift
//  HotProspects
//
//  Created by denpazakura on 17/12/2020.
//

import SwiftUI

struct ManualPublishing: View {
    @ObservedObject var updater = DelayedUpdater()

    var body: some View {
        Text("Value is: \(updater.value)")
    }
}

struct ManualPublishing_Previews: PreviewProvider {
    static var previews: some View {
        ManualPublishing()
    }
}
