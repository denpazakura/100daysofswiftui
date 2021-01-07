//
//  ResortView.swift
//  SnowSeeker
//
//  Created by denpazakura on 06/01/2021.
//

import SwiftUI

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    @EnvironmentObject var favorites: Favorites
    
    @State private var selectedFacility: Facility?
    
    let resort: Resort
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                GeometryReader { geomtry in
                    Image(decorative: resort.id)
                        .resizable()
                        .scaledToFit()
                        .overlay(
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("Photo credits: \(resort.imageCredit)")
                                        .font(.caption)
                                        .foregroundColor(Color.black)
                                        .background(Color.white.opacity(0.8))
                                }
                            }
                        )
                }
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    HStack {
                        if sizeClass == .compact {
                            Spacer()
                            VStack { ResortDetailsView(resort: resort) }
                            VStack { SkiDetailsView(resort: resort) }
                            Spacer()
                        } else {
                            ResortDetailsView(resort: resort)
                            Spacer().frame(height: 0)
                            SkiDetailsView(resort: resort)
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)
                    
                    Text("Facilities")
                        .font(.headline)
                    //
                    //                    Text(ListFormatter.localizedString(byJoining: resort.facilities))
                    //                        .padding(.vertical)
                    
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            facility.icon
                                .font(.title)
                                .onTapGesture {
                                    self.selectedFacility = facility
                                }
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)
        .alert(item: $selectedFacility) { facility in
            facility.alert
        }
        Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
            if self.favorites.contains(self.resort) {
                self.favorites.remove(self.resort)
            } else {
                self.favorites.add(self.resort)
            }
        }
        .padding()
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example)
    }
}
