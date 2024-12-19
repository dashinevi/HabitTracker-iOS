//
//  HabitCheckView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 17/12/2024.
//
import SwiftUI
import SwiftData

struct HabitCheckView: View {
    @Bindable var habit: Habit
    
    var body: some View {
        Button(action: {
            let today = Calendar.current.startOfDay(for: Date())
            if !habit.completedDates.contains(today) {
                habit.completedDates.append(today) 
            }
        }) {
            Image(systemName: habit.completedDates.contains(Calendar.current.startOfDay(for: Date())) ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.green)
        }
    }
}




