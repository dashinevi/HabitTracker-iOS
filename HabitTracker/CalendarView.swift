//
//  CalendarView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 17/12/2024.
//
import SwiftUI

struct CalendarView: View {
    let calendar: Calendar
    var completedDates: [Date]
    
    init(completedDates: [Date]) {
        var calendar = Calendar.current
        let locale = Locale.current
        calendar.locale = locale
        self.calendar = calendar
        self.completedDates = completedDates
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(weekDays(), id: \.self) { weekday in
                    VStack {
                        Text(weekday)
                            .foregroundColor(.black)
                        
                        Circle()
                            .fill(isDayActive(weekday: weekday) ? Color.green : .clear)
                            .frame(width: 10, height: 10)
                    }
                }
            }
            .padding()
        }
    }
    
    func weekDays(date: Date = Date()) -> [String] {
        let firstWeekday = calendar.firstWeekday
        var weekdays = calendar.shortWeekdaySymbols
        
        for _ in 1..<firstWeekday {
            weekdays.append(weekdays.removeFirst())
        }
        
        return weekdays
    }
    
    func isDayActive(weekday: String) -> Bool {
        let weekdayIndex = weekDays().firstIndex(of: weekday) ?? 0
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
        
        return completedDates.contains { date in
            let dayIndex = calendar.component(.weekday, from: date) - calendar.firstWeekday
            let adjustedDayIndex = (dayIndex + 7) % 7
            return adjustedDayIndex == weekdayIndex && calendar.isDate(date, equalTo: startOfWeek, toGranularity: .weekOfYear)
        }
    }
}


//#Preview {
//    CalendarView()
//}

