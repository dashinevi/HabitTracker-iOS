//
//  CurrentWeekView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 17/12/2024.
//
import SwiftUI

struct CurrentWeekView: View {
    func getCurrentWeekRange() -> String {
        let calendar = Calendar.current
        let today = Date()
        
        guard let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: today)?.start else {
            return "Unable to determine week range."
        }
        
        let endOfWeek = calendar.date(byAdding: .day, value: 6, to: startOfWeek)!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let startOfWeekString = dateFormatter.string(from: startOfWeek)
        let endOfWeekString = dateFormatter.string(from: endOfWeek)
        
        return "\(startOfWeekString) - \(endOfWeekString)"
    }
    
    var body: some View {
        VStack {
            Text(getCurrentWeekRange())
                .font(.title3)
                .fontDesign(.rounded)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    CurrentWeekView()
}
