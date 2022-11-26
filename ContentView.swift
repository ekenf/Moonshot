//
//  ContentView.swift
//  MoonShot
//
//  Created by Furkan Eken on 16.11.2022.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut]  = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State var showingGrid: Bool = true
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions ,showingGrid: $showingGrid)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions ,showingGrid: $showingGrid)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
