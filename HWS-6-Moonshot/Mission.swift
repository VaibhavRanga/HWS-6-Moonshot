//
//  Mission.swift
//  HWS-6-Moonshot
//
//  Created by Vaibhav Ranga on 25/05/24.
//

import Foundation

struct Mission: Codable, Identifiable, Hashable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var differentDateFormat: String {
        launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A"
    }
}
