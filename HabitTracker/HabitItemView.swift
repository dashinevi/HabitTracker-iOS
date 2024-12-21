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
                .fill(Color(hex: habit.colorHex)?.opacity(0.5) ?? .white )
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
