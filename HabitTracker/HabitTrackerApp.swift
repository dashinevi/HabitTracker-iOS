//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 10/12/2024.
//

import SwiftData
import SwiftUI

@main
struct HabitTrackerApp: App {
//    @AppStorage isOnboardingPassed = false
    
    var body: some Scene {
        WindowGroup {
//            if isOnboardingPassed {
//                Onboarding // set isOnboardingPassed = true on submit
//            } else {
//                ContentView()
//            }
            
//            OnboardingView()
            ContentView()
                .fontDesign(.rounded)
        }
        .modelContainer(for: Habit.self)
    }
}
