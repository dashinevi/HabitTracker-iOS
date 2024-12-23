//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 10/12/2024.
//

import SwiftData
import SwiftUI
import Combine

@main
struct HabitTrackerApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
            
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
                    .fontDesign(.rounded)
            } else {
                ContentView()
                    .fontDesign(.rounded)
            }
        }
        .modelContainer(for: Habit.self)
    }
}
