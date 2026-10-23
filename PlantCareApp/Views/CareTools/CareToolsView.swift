//
//  CareToolsView.swift
//  PlantCareApp
//
//  Created by cobsccomp251p-24 on 2026-10-23.
//

import Foundation
import SwiftUI

struct CareToolsView: View {
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("plantBackground").ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("MY PLANT CARE").font(.caption).fontWeight(.bold).foregroundColor(.gray).tracking(1)
                                Text("Care tools").font(.system(size: 34, weight: .bold, design: .serif)).foregroundColor(Color("plantText"))
                            }
                            Spacer()
                            Text("M").font(.headline).foregroundColor(.white).frame(width: 40, height: 40).background(Color.orange.opacity(0.7)).clipShape(Circle())
                        }.padding(.top, 10)
                        
                        ZStack(alignment: .bottomLeading) {
                            Color("plantSecondary").frame(height: 200).frame(maxWidth: .infinity).cornerRadius(20)
                                .overlay(LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.6)]), startPoint: .center, endPoint: .bottom).cornerRadius(20))
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("3 plants need\nyour attention").font(.title).fontWeight(.bold).foregroundColor(.white)
                                Button(action: {}) {
                                    Text("View care plan").font(.footnote).fontWeight(.bold).foregroundColor(Color("plantPrimary"))
                                        .padding(.horizontal, 16).padding(.vertical, 8).background(Color.white).cornerRadius(20)
                                }
                            }.padding(20)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Organize your garden").font(.title2).fontWeight(.bold).foregroundColor(Color("plantText"))
                            Text("Everything your plants need, in one place.").font(.subheadline).foregroundColor(.gray)
                        }
                        
                        LazyVGrid(columns: columns, spacing: 16) {
                            NavigationLink(destination: WateringScheduleView()) {
                                ToolCard(icon: "drop.fill", iconColor: .blue, title: "Watering", subtitle: "4 plants due this week")
                            }
                            .buttonStyle(PlainButtonStyle()) // Keeps it looking like a card

                            // Change the Growth records ToolCard to this:
                            NavigationLink(destination: GrowthRecordsView()) {
                                ToolCard(icon: "chart.line.uptrend.xyaxis", iconColor: .green, title: "Growth records", subtitle: "+8.4 cm this month")
                            }
                            .buttonStyle(PlainButtonStyle())
                            ToolCard(icon: "chart.line.uptrend.xyaxis", iconColor: .green, title: "Growth records", subtitle: "+8.4 cm this month")
                            ToolCard(icon: "photo", iconColor: .pink, title: "Plant photos", subtitle: "48 memories")
                            ToolCard(icon: "clock.arrow.circlepath", iconColor: .purple, title: "Care history", subtitle: "All activity in one place")
                            ToolCard(icon: "camera.viewfinder", iconColor: .green, title: "Remind & Scan", subtitle: "Smart alerts")
                        }
                    }.padding(.horizontal, 20).padding(.bottom, 30)
                }
            }.navigationBarHidden(true)
        }
    }
}

struct ToolCard: View {
    let icon: String; let iconColor: Color; let title: String; let subtitle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image(systemName: icon).font(.title3).foregroundColor(iconColor)
                .frame(width: 45, height: 45).background(iconColor.opacity(0.15)).clipShape(Circle())
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title).font(.headline).foregroundColor(Color("plantText"))
                    Spacer()
                    Image(systemName: "chevron.right").font(.caption).foregroundColor(.gray)
                }
                Text(subtitle).font(.caption).foregroundColor(.gray).lineLimit(1)
            }
        }.padding(16).background(Color.white).cornerRadius(20)
    }
}

