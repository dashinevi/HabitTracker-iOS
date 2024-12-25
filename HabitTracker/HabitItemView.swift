//
//  HabitItemView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 13/12/2024.
//
import SwiftUI
import SwiftData

struct HabitItemView: View {
    @Bindable var habit: Habit
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(habit.title)
                    .font(.headline)
                if let details = habit.details {
                    Text(details)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            HabitCheckView(habit: habit)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 13)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(hex: habit.colorHex)?.opacity(0.5) ?? .white,
                            .white, .white
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(Color.primary, lineWidth: 1)
                )
        )
    }
}


