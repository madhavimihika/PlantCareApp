//
//  PlantCardView.swift
//  PlantCareApp
//
//  Created by cobsccomp251p-24 on 2026-10-23.
//

import Foundation
import SwiftUI
struct PlantSummaryCardView: View {
    let plant: Plant
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Color.gray.opacity(0.1).frame(height: 140).cornerRadius(16)
                Image(systemName: plant.imageName).resizable().scaledToFit().frame(width: 60, height: 60)
                    .foregroundColor(.plantSecondary).frame(maxWidth: .infinity, maxHeight: .infinity)
                Circle().fill(plant.health == .healthy ? Color.plantPrimary : Color.orange).frame(width: 10, height: 10).padding(10)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(plant.name).font(.headline).foregroundColor(.plantText)
                Text("\(plant.botanicalName) • \(plant.location)").font(.caption).foregroundColor(.gray).lineLimit(1)
                Text(plant.health.rawValue).font(.caption2).fontWeight(.bold)
                    .foregroundColor(plant.health == .healthy ? .plantPrimary : .orange)
                    .padding(.horizontal, 10).padding(.vertical, 4)
                    .background(plant.health == .healthy ? Color.plantBackground : Color.orange.opacity(0.1)).cornerRadius(10).padding(.top, 4)
            }.padding(.horizontal, 4)
        }.padding(10).background(Color.white).cornerRadius(16).shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

