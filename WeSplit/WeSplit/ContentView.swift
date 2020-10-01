//
//  ContentView.swift
//  WeSplit
//
//  Created by denpazakura on 27/09/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var numberOfPeople = ""
    @State var checkAmount = ""
    @State var tipPercentage = 0
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        
        return orderAmount + tipValue
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 1
        
        return grandTotal / peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Check amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                }
                
                ZStack {
                    //Color.red
                    Text("Your content")
                } .background(Color.red)
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Grand total")) {
                    Text("$\(grandTotal, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
