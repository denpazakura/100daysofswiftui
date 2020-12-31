//
//  OuterView.swift
//  LayoutAndGeometry
//
//  Created by denpazakura on 31/12/2020.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(Color.green)
            Text("Bottom")
        }
    }
}

struct OuterView_Previews: PreviewProvider {
    static var previews: some View {
        OuterView()
    }
}
