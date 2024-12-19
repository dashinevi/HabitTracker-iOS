//
//  StatisticsView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 14/12/2024.
//

import SwiftUI
import SwiftData

struct ProgressView: View {
    @Environment(\.modelContext) var modelContext
    @Query var habits: [Habit]
    
    var body: some View {
        VStack {
            Text("Statistics")
                .fontDesign(.rounded)
                .font(.headline)
                .fontWeight(.bold)
            CurrentWeekView()
        }
        ScrollView {
            VStack (spacing: 10) {
                ForEach(habits) { habit in
                    ProgressItemView(
                        title: habit.title,
                        description: habit.details,
                        color: Color(hex: habit.colorHex) ?? .white,
                        goal: habit.goal,
                        frequency: habit.frequency,
                        goalPeriod: habit.goalPeriod,
                        completedDates: habit.completedDates
                    )
                }
            }
            .padding()
           
        }
    }
}


//#Preview {
//    ProgressView(
//        habits: .constant([
//            Habit(title: "title", description: "desc", color: .clear, goal: 10, frequency: 10, goalPeriod: "Week"),
//            Habit(title: "title", description: "desc", color: .clear, goal: 10, frequency: 10, goalPeriod: "Week")
//        ])
//    )
//}

