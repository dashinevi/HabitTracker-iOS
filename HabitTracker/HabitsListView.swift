//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 13/12/2024.
//
import SwiftUI

struct HabitsListView: View {
    @Binding var habits: [Habit]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(habits) { habit in
                    HabitItemView(habit: habit)
                        .contextMenu {
                            Button("Edit", systemImage: "pencil") {}
                            Button("Delete", systemImage: "trash", role: .destructive) {
                                habits.removeAll(where: { $0.id == habit.id })
                            }
                        }
                }
            }
        }
        .padding(.horizontal, 10)
    }
}

//#Preview {
//    HabitsListView(
//        habits: .constant([
//            Habit(title: "title", description: "desc", color: .clear, goal: 10, frequency: 10, goalPeriod: "Week"),
//            Habit(title: "title", description: "desc", color: .clear, goal: 10, frequency: 10, goalPeriod: "Week")
//        ])
//    )
//}
