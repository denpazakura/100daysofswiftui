//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by denpazakura on 31/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order

    var body: some View {
        Text("Hello, World!")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
