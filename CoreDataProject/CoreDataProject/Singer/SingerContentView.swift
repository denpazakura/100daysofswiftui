//
//  SingerContentView.swift
//  CoreDataProject
//
//  Created by denpazakura on 10/11/2020.
//

import SwiftUI

struct SingerContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            // list of matching singers
            
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
            
            FilteredList(filter: lastNameFilter)
        }
    }
}

struct SingerContentView_Previews: PreviewProvider {
    static var previews: some View {
        SingerContentView()
    }
}
