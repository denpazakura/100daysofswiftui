//
//  EditView.swift
//  BucketList
//
//  Created by denpazakura on 26/11/2020.
//

import SwiftUI
import MapKit

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var placemark: MKPointAnnotation

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $placemark.wrappedTitle)
                    TextField("Description", text: $placemark.wrappedSubtitle)
                }
            }
            .navigationBarTitle("Edit place")
            .navigationBarItems(trailing: Button("Done") {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(placemark: MKPointAnnotation.example)
    }
}
