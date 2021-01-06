//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by denpazakura on 06/01/2021.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort

    private var size: String {
        ["Small", "Average", "Large"][resort.size - 1]
    }
    
    private var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    var body: some View {
        Group {
            Text("Size: \(size)")
            Spacer().frame(height: 0)
            Text("Price: \(price)")
        }
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resort: Resort.example)
    }
}
