//
//  ContentView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 10/12/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var habits: [Habit]
   
    @State private var isShowingSheet = false
    
    @State private var activeTab: Tab = .home
    
    var body: some View {
        NavigationStack {
            VStack {
                switch activeTab {
                case .home:
                    HomeView()
                case .progress:
                    ProgressView()
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
                HabitDetailsView(isShowingSheet: $isShowingSheet)
            }
//            .background(Color.red)
        }
    }
}

#Preview {
    ContentView()
}
