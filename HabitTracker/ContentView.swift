//
//  ContentView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 10/12/2024.
//

import SwiftUI


struct ContentView: View {
    @State private var habits: [Habit] = [
        Habit(title: "Study", description: "Study for 2 hours", color: .white, goal: 100, frequency: 10, goalPeriod: "Week", completedDates: [])
    ]
   
    @State private var isShowingSheet = false
    
    @State private var activeTab: Tab = .home
    
    var body: some View {
        NavigationStack {
            VStack {
                switch activeTab {
                case .home:
                    HomeView(habits: $habits)
                case .progress:
                    ProgressView(habits: $habits)
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    TabBarView(selectedTab: $activeTab) {
                        self.isShowingSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                HabitDetailsView(habits: $habits, isShowingSheet: $isShowingSheet)
            }
        }
    }
}


#Preview {
    ContentView()
}
