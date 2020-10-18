//
//  SwiftUIView.swift
//  iExpense
//
//  Created by denpazakura on 17/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @State private var showingAlert = false

    static let types = ["Business", "Personal"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                
                guard let actualAmount = Int(self.amount) else {
                    self.showingAlert = true
                    return
                }
                
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
              
            })
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Please enter an integer"), dismissButton: .default(Text("Dismiss")) {
                })
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: .init())
    }
}
