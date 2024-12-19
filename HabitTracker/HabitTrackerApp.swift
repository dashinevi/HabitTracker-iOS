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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Habit.self)
    }
}
