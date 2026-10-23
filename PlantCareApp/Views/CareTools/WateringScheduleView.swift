//
//  WateringScheduleView.swift
//  PlantCareApp
//
//  Created by cobsccomp251p-24 on 2026-10-23.
//
import SwiftUI

struct WateringScheduleView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.plantBackground.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Next Watering Card
                        VStack(alignment: .leading, spacing: 0) {
                            // Image Header
                            ZStack(alignment: .bottomLeading) {
                                Color.green.opacity(0.2) // Placeholder for Monstera image
                                    .frame(height: 180)
                                    .overlay(Image(systemName: "leaf.fill").font(.system(size: 80)).foregroundColor(.white.opacity(0.5)))
                                
                                HStack {
                                    Image(systemName: "drop.fill")
                                    Text("Every 5 days")
                                }
                                .font(.caption).fontWeight(.bold).foregroundColor(.white)
                                .padding(.horizontal, 10).padding(.vertical, 6)
                                .background(Color.plantPrimary)
                                .clipShape(Capsule())
                                .padding(15)
                            }
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("TOMORROW").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                                Text("Monstera Deliciosa").font(.title2).fontWeight(.bold)
                                
                                HStack {
                                    Image(systemName: "clock.fill")
                                    Text("8:00 AM").font(.headline)
                                }
                                Text("Last watered: September 23").font(.caption).foregroundColor(.gray)
                                
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "checkmark")
                                        Text("Mark as Watered")
                                    }
                                    .font(.headline).foregroundColor(.white).frame(maxWidth: .infinity)
                                    .padding().background(Color.plantPrimary).cornerRadius(12)
                                }
                                .padding(.top, 10)
                            }
                            .padding(20)
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                        
                        // Upcoming Section
                        HStack {
                            Text("Upcoming").font(.title3).fontWeight(.bold)
                            Spacer()
                            Text("View calendar").font(.subheadline).foregroundColor(.plantPrimary)
                        }
                        
                        // Upcoming List
                        VStack(spacing: 12) {
                            UpcomingWateringRow(plantName: "Monstera Deliciosa", time: "Tomorrow, 8:00 AM")
                            UpcomingWateringRow(plantName: "Peace Lily", time: "Tomorrow, 9:00 AM")
                            UpcomingWateringRow(plantName: "Snake Plant", time: "September 29, 8:30 AM")
                        }
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Watering Schedule")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left").foregroundColor(.plantText)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus").foregroundColor(.white).padding(8).background(Color.plantPrimary).clipShape(Circle())
                    }
                }
            }
        }
    }
}

struct UpcomingWateringRow: View {
    var plantName: String
    var time: String
    var body: some View {
        HStack {
            Color.plantSecondary.opacity(0.3).frame(width: 60, height: 60).clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(Image(systemName: "leaf.fill").foregroundColor(.plantPrimary))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(plantName).font(.headline)
                Text(time).font(.caption).foregroundColor(.gray)
            }
            Spacer()
            Circle().fill(Color.gray.opacity(0.3)).frame(width: 8, height: 8)
        }
        .padding(12).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
