//
//  GridLayout.swift
//  MoonShot
//
//  Created by Furkan Eken on 21.11.2022.
//

import SwiftUI

struct GridLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    @Binding var showingGrid: Bool
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.75))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground))
                        }
                    }
                }.navigationTitle("Moonshot")
                    .toolbar {
                        Button("Change View") {
                            self.showingGrid.toggle()
                        }
                    }
                .background(.darkBackground)
                .preferredColorScheme(.dark)
                .padding([.horizontal, .bottom])
            }
        }
        
    }
}
