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
    let frequency: Int
    let goalPeriod: String
    let completedDates: [Date]
    
    var body: some View {
        
        let currentStreak = calculateStreakWithGoals(
            frequency: frequency,
            goalPeriod: goalPeriod,
            completedDates: completedDates
        )
        
        VStack{
            HStack {
                Spacer()
                Image(systemName: currentStreak > 0 ? "flame.fill" : "circle")
                    .foregroundColor(currentStreak > 0 ? .myAccent : .gray)
                Text("You met your goal \(currentStreak) time\(currentStreak == 1 ? "" : "s")")
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
    func startDate(for goalPeriod: String, from date: Date) -> Date {
        let calendar = Calendar.current
        switch goalPeriod {
        case "week":
            return calendar.dateInterval(of: .weekOfYear, for: date)?.start ?? date
        case "month":
            return calendar.dateInterval(of: .month, for: date)?.start ?? date
        case "year":
            return calendar.dateInterval(of: .year, for: date)?.start ?? date
        default:
            return date
        }
    }
    
    
    func calculateStreakWithGoals(
        frequency: Int,
        goalPeriod: String,
        completedDates: [Date]
    ) -> Int {
        let calendar = Calendar.current
        let sortedDates = completedDates.sorted()
        var streak = 0
        var currentPeriodStart: Date?
        var periodCompletions = 0
        
        for date in sortedDates {
            if currentPeriodStart == nil || date >= calendar.date(byAdding: .day, value: 1, to: currentPeriodStart!)! {
                
                if let start = currentPeriodStart, periodCompletions < frequency {
                    streak = 0
                }
                
                
                currentPeriodStart = startDate(for: goalPeriod, from: date)
                periodCompletions = 0
            }
            
            if date >= currentPeriodStart! {
                periodCompletions += 1
            }
            
            if periodCompletions >= frequency {
                streak += 1
            }
        }
        
        if let start = currentPeriodStart, periodCompletions < frequency {
            streak = 0
        }
        
        return streak
    }
}

#Preview {
    ProgressItemView(title: "Meditation", description: "30 minutes", color: .white, /*goal: 20,*/ frequency: 2, goalPeriod: "Week", completedDates: [])
}
