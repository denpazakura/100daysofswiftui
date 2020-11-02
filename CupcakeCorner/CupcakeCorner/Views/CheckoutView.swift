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
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    private var requestFactory: NetworkRequestFactory!
    
    init(order: Order, requestFactory: NetworkRequestFactory) {
        self.order = order
        self.requestFactory = requestFactory
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place Order") {
                        self.placeOrder()
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text("Thank you!"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
    }
}

private extension CheckoutView {
    func placeOrder()  {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        let request = requestFactory.makePostRequest(for: url, encodedData: encoded)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let err = error { handleError(error: err) }
                return
            }
                        
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
                self.showingConfirmation = true
            } else {
                print("Invalid response from server")
            }
            
        }.resume()
    }
    
    func handleError(error: Error) {
        //no wifi alert if code is 1009
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order(), requestFactory: NetworkRequestFactory())
    }
}
