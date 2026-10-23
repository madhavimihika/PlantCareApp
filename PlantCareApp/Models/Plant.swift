//
//  Plant.swift
//  PlantCareApp
//
//  Created by cobsccomp251p-24 on 2026-10-23.
//

import Foundation

enum PlantHealth: String {
    case healthy = "Health"
    case needsCare = "Needs care"
}

struct Plant: Identifiable {
    let id = UUID()
    let name: String
    let botanicalName: String
    let location: String
    let health: PlantHealth
    let imageName: String
}
