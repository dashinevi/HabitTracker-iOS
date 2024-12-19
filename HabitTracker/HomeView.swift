//
//  HomeView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 16/12/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Hello, Kate!")
                    .font(.title)
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .foregroundStyle(.pink)
                
                Text("How are you feeling today?")
                    .font(.title3)
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
            }
            .frame(width: 300, height: 80)
            
            HStack {
                Spacer()
                Text(Date.now, format: .dateTime.day().month().year())
                    .font(.title3)
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
            }
            .padding()
            
            Spacer()
            
            HabitsListView()
        }
    }
}

//#Preview {
//    HomeView(
//        habits: .constant([
//            Habit(title: "title", description: "desc", color: .clear, goal: 10, frequency: 10, goalPeriod: "Week"),
//            Habit(title: "title", description: "desc", color: .clear, goal: 10, frequency: 10, goalPeriod: "Week")
//        ])
//    )
//}
