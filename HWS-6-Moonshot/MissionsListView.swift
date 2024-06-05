//
//  MissionsListView.swift
//  HWS-6-Moonshot
//
//  Created by Vaibhav Ranga on 27/05/24.
//

import SwiftUI

struct MissionsListView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        LazyVStack {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                        
                        Spacer()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.title)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.headline)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding()
                    .clipShape(.capsule)
                    .overlay(
                        Capsule()
                            .stroke(.white)
                    )
                }
            }
            .padding()
        }
        .navigationDestination(for: Mission.self) { mission in
            MissionView(mission: mission, astronauts: astronauts)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionsListView(missions: missions, astronauts: astronauts)
        .preferredColorScheme(.dark)
}
