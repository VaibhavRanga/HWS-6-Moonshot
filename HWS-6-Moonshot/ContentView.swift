//
//  ContentView.swift
//  HWS-6-Moonshot
//
//  Created by Vaibhav Ranga on 24/05/24.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var isGridViewSelected = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Group {
                    if isGridViewSelected {
                        MissionsGridView(missions: missions, astronauts: astronauts)
                    } else {
                        MissionsListView(missions: missions, astronauts: astronauts)
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                if isGridViewSelected {
                    Button("Show as List") {
                        isGridViewSelected = false
                    }
                } else {
                    Button("Show as Grid") {
                        isGridViewSelected = true
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
