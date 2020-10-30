//
//  SwiftUIView.swift
//  iExpense
//
//  Created by denpazakura on 30/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var activityRepository: ActivityRepository
    
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var description = ""
    
    @State private var showingAlert = false

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add activity")
            .navigationBarItems(trailing: Button("Save") {
                
                let item = Activity(name: self.name, description: self.description, date: Date())
                    self.activityRepository.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activityRepository: .init())
    }
}
