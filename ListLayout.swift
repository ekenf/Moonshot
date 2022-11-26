//
//  ListLayout.swift
//  MoonShot
//
//  Created by Furkan Eken on 21.11.2022.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    @Binding var showingGrid: Bool
    
    var body: some View {
        NavigationView {
                List {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            VStack{
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.75))
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
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
        }
    }
}
