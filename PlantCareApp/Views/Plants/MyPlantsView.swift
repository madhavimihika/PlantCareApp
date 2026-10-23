//
//  MyPlantsView.swift
//  PlantCareApp
//
//  Created by cobsccomp251p-24 on 2026-10-23.
//

import Foundation
import SwiftUI
struct MyPlantsView: View {
    @StateObject private var viewModel = MyPlantsViewModel()
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.plantBackground.ignoresSafeArea()
                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "chevron.left").font(.title3).foregroundColor(.plantText).padding(10).background(Color.white).clipShape(Circle())
                        Spacer()
                        Text("My Plants").font(.title3).fontWeight(.bold).foregroundColor(.plantText)
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "plus").font(.title3).foregroundColor(.white).padding(10).background(Color.plantPrimary).clipShape(Circle())
                        }
                    }.padding(.horizontal, 20).padding(.top, 10)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("YOUR GARDEN").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                                Text("Today's care").font(.title2).fontWeight(.bold).foregroundColor(.plantText)
                            }.padding(.horizontal, 20).padding(.top, 10)
                            
                            // Filter Pills
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    FilterPill(title: "All", count: viewModel.allCount, isSelected: viewModel.selectedFilter == "All") { viewModel.selectedFilter = "All" }
                                    FilterPill(title: "Healthy", count: viewModel.healthyCount, isSelected: viewModel.selectedFilter == "Healthy") { viewModel.selectedFilter = "Healthy" }
                                    FilterPill(title: "Need care", count: viewModel.needsCareCount, isSelected: viewModel.selectedFilter == "Need care") { viewModel.selectedFilter = "Need care" }
                                }.padding(.horizontal, 20)
                            }
                            
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(viewModel.filteredPlants) { plant in
                                    PlantCardView(plant: plant)
                                }
                            }.padding(.horizontal, 20).padding(.bottom, 30)
                        }
                    }
                }
            }.navigationBarHidden(true)
        }
    }
}

struct FilterPill: View {
    let title: String; let count: Int; let isSelected: Bool; let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Text(title)
                Text("\(count)").font(.caption2).fontWeight(.bold).padding(.horizontal, 6).padding(.vertical, 2)
                    .background(isSelected ? Color.white.opacity(0.3) : Color.plantBackground).cornerRadius(8)
            }
            .font(.subheadline).fontWeight(.semibold).foregroundColor(isSelected ? .white : .plantText)
            .padding(.horizontal, 16).padding(.vertical, 8).background(isSelected ? Color.plantPrimary : Color.white).cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.2), lineWidth: isSelected ? 0 : 1))
        }
    }
}
