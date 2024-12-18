//
//  HabitItemView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 13/12/2024.
//
import SwiftUI

struct Habit: Identifiable {
    let id = UUID()
    var title: String
    var description: String?
    var color: Color
    var goal: Int
    var frequency: Int
    var goalPeriod: String
    var completedDates: [Date]
}

struct HabitItemView: View {
    @State var habit: Habit
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(habit.title)
                    .font(.headline)
                if let description = habit.description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            HabitCheckView(habit: $habit)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 13)
                .fill(habit.color)
                .strokeBorder(Color.primary, lineWidth: 1, antialiased: true)
        )
    }
}

//#Preview {
//    HabitItemView(title: "title", description: "desc", color: .clear)
//    //        .frame(width: 380, height: 30)
//    HabitItemView(title: "no desc", description: nil, color: .clear)
//    //        .frame(width: 380, height: 30)
//}
