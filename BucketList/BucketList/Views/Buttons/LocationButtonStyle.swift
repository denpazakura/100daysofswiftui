//
//  LocationButtonStyle.swift
//  BucketList
//
//  Created by denpazakura on 30/11/2020.
//

import SwiftUI

struct LocationButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
         configuration.label
            .padding()
            .background(Color.black.opacity(0.75))
            .foregroundColor(.white)
            .font(.title)
            .clipShape(Circle())
            .padding(.trailing)
     }
}
