//
//  ContentView.swift
//  Freaq
//
//  Created by denpazakura on 29/09/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    let inputUnits = UnitInfoProvider.inputUnits()
    let outputUnits = UnitInfoProvider.outputUnits()
    let symbols = UnitInfoProvider.unitSymbols()
    
    @State var inputAmount = "0"
    
    @State private var inputIndices = Array(repeating: 0, count: Frequency.allCases.count)
    @State private var outputIndices = Array(repeating: 0, count: Frequency.allCases.count)
    
    @State private var inputUnitIndex = 0
    @State private var outputUnitIndex = 0
    
    var outputUnit: String {
        let index = outputIndices[outputUnitIndex]
        return Frequency.allCases[index].rawValue
    }
    
    var inputUnit: String {
        let index = inputIndices[inputUnitIndex]
        return UnitInfoProvider.frequencyUnits()[index].rawValue
    }
    
    var conversionResult: Double {
        guard let input = UnitInfoProvider.unit(with: inputUnit) else {
            print("Invalid input unit")
            return 0
        }
        
        let measurement = Measurement(value: Double(inputAmount) ?? 0, unit: input)
        
        guard let output = UnitInfoProvider.unit(with: outputUnit) else {
            print("Invalid output unit")
            return 0
        }
        
        return measurement.converted(to: output).value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter units")) {
                    HStack {
                        TextField("0", text: $inputAmount).tag("amount")
                            .keyboardType(.decimalPad)
                        Spacer()
                        Text(inputUnit.capitalized)
                    }
                }
                
                Section(header: Text("Select input units")) {
                    Picker("", selection: $inputIndices[inputUnitIndex]) {
                        
                        ForEach(0 ..< symbols.count) { unit in
                            Text("\(self.symbols[unit])").tag("input")
                        }
                    }
                    .id(inputUnitIndex)
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Select output units")) {
                    Picker("", selection: $outputIndices[outputUnitIndex]) {
                        
                        ForEach(0 ..< symbols.count) { unit in
                            Text("\(self.symbols[unit])").tag("output")
                        }
                    }
                    .id(outputUnitIndex)
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output")) {
                    HStack {
                        Text(String(conversionResult)).tag("result")
                        Spacer()
                        Text(outputUnit.capitalized)
                    }
                }
                
            }
            .navigationBarTitle("Frequency converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
