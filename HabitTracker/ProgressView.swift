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
        VStack (alignment: .leading) {
            HStack {
                Text("Statistics")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.myPrimary)
                Spacer()
            }
            CurrentWeekView()
        }
        .padding(.horizontal)
        
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


#Preview {
    ProgressView()
}

