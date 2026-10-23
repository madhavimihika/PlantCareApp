//
//  MyPlantsViewModel.swift
//  PlantCareApp
//
//  Created by cobsccomp251p-24 on 2026-10-23.
//

import SwiftUI
import Combine

class MyPlantsViewModel: ObservableObject {
    @Published var plants: [Plant] = [
        Plant(name: "Pip", botanicalName: "Ficus lyrata", location: "Bedroom", health: .healthy, imageName: "leaf.fill"),
        Plant(name: "Pothos", botanicalName: "Ficus lyrata", location: "Bedroom", health: .needsCare, imageName: "leaf.fill"),
        Plant(name: "Croton", botanicalName: "Monstera", location: "Living room", health: .healthy, imageName: "leaf.fill"),
        Plant(name: "Fern", botanicalName: "Ficus lyrata", location: "Bedroom", health: .healthy, imageName: "leaf.fill"),
        Plant(name: "Palm", botanicalName: "Outdoor", location: "Balcony", health: .needsCare, imageName: "leaf.fill"),
        Plant(name: "Pip", botanicalName: "Ficus lyrata", location: "Bedroom", health: .healthy, imageName: "leaf.fill")
    ]
    
    @Published var selectedFilter: String = "All"
    
    var filteredPlants: [Plant] {
        switch selectedFilter {
        case "Healthy": return plants.filter { $0.health == .healthy }
        case "Need care": return plants.filter { $0.health == .needsCare }
        default: return plants
        }
    }
    
    var allCount: Int { plants.count }
    var healthyCount: Int { plants.filter { $0.health == .healthy }.count }
    var needsCareCount: Int { plants.filter { $0.health == .needsCare }.count }
}
