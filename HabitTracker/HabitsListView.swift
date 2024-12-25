//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 13/12/2024.
//
import SwiftUI
import SwiftData

struct HabitsListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var habits: [Habit]
    
    var body: some View {
        if habits.isEmpty {
            VStack {
                Image(systemName: "list.clipboard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.mySecondary)
                    .padding(.vertical)
                Text("No habits yet")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.mySecondary)
                Spacer()
            }
            .frame(maxWidth: .infinity)
        } else {
            ScrollView {
                VStack(spacing: 10) {
                    
                    
                    ForEach(habits) { habit in
                        HabitItemView(habit: habit)
                            .contextMenu {
    //                            Button("Edit", systemImage: "pencil") {}
                                Button("Delete", systemImage: "trash", role: .destructive) {
                                    self.modelContext.delete(habit)
                                }
                            }
                    }
                    
                }
                .padding(10)
            }
        }
    }
}

#Preview {
    HabitsListView()
        .modelContainer(for: Habit.self)
}
