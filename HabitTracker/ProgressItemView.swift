//
//  ProgressItemView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 16/12/2024.
//
import SwiftUI

struct ProgressItemView: View {
    
    let title: String
    let description: String?
    let color: Color
    let goal: Int
    let frequency: Int
    let goalPeriod: String
    let completedDates: [Date]
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Image(systemName: "flame")
                Text("\(goal)")
                    .fontWeight(.semibold)
            }
            .padding()
                HStack {
                    VStack {
                        Text(title)
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .padding(.leading)
                    Spacer()
                    VStack {
                        Text("\(frequency) times per \(goalPeriod)")
                            .foregroundStyle(.secondary)
                            .font(.caption)
                    }
                    .padding(.horizontal)
                }
            Divider()
                .frame(width: 350)
                
            CalendarView(completedDates: completedDates)
        }
        .background(
            RoundedRectangle(cornerRadius: 13)
                .fill(.clear)
                .strokeBorder(Color.primary, lineWidth: 1, antialiased: true)
        )
    }
}

#Preview {
    ProgressItemView(title: "Meditation", description: "30 minutes", color: .white, goal: 20, frequency: 2, goalPeriod: "Week", completedDates: [])
}
