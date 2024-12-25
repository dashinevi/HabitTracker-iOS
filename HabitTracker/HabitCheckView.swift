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
            if let index = habit.completedDates.firstIndex(of: today) {
                habit.completedDates.remove(at: index)
            } else {
                habit.completedDates.append(today)
            }
        }) {
            Image(systemName: habit.completedDates.contains(Calendar.current.startOfDay(for: Date())) ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.black)
        }
    }
    
    

}





