////
////  TabbarView.swift
////  HabitTracker
////
////  Created by Diana Dashinevich on 16/12/2024.
////
import SwiftUI

enum Tab: String, CaseIterable, Identifiable {
    case home
    case progress
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .progress: return "Progress"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "house"
        case .progress: return "chart.bar"
        }
    }
}

struct TabBarView: View {
    @Binding var selectedTab: Tab
    let addAction: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button(Tab.home.title, systemImage: Tab.home.icon) {
                withAnimation {
                    selectedTab = .home
                }
            }
            .tint(selectedTab == .home ? .pink : .black)
            Spacer()
            Button {
                addAction()
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 70)
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.title2)
                }
            }
            Spacer()
            Button(Tab.progress.title, systemImage: Tab.progress.icon) {
                withAnimation {
                    selectedTab = .progress
                }
            }
            .tint(selectedTab == .progress ? .pink : .black)
            
            Spacer()
        }
    }
}
