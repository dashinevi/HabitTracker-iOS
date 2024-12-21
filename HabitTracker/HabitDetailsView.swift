//
//  HabitDetailsView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 16/12/2024.
//
import SwiftUI
import SwiftData

struct HabitDetailsView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var isShowingSheet: Bool
        
    @State private var habitTitle = ""
    @State private var habitDescription: String = ""
    @State private var goal: Int = 0
    @State private var frequency: Int = 0
    @State private var goalPeriod = "Week"
    let goalPeriods = ["Week", "Month", "Year"]
       
    @State private var selectedColor: Color = .white
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    isShowingSheet.toggle()
                }
                .buttonStyle(.borderless)
                .foregroundStyle(.mySecondary)
                
                Spacer()
                
                Button("Save") {
                    addHabit()
                    habitTitle = ""
                    habitDescription = ""
                    goal = 0
                    frequency = 0
                    goalPeriod = "Week"
                    selectedColor = .white
                    isShowingSheet = false
                }
                .disabled(habitTitle.isEmpty)
                .foregroundStyle(.myAccent.opacity(habitTitle.isEmpty ? 0.5 : 1))
                
            }
            .padding()
            
            HStack {
                Text("Add a New Habit")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.myPrimary)
                Spacer()
            }
            
            VStack {
                
                TextField("Enter a habit title", text: $habitTitle)
                    .frame(height: 50)
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(.secondary, lineWidth: 1)
                        .fill(.clear)
                        .frame(maxWidth: .infinity))
                
                TextField("Enter a description", text: $habitDescription)
                    .frame(height: 50)
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(.secondary, lineWidth: 1)
                        .fill(.clear)
                        .frame(maxWidth: .infinity))
            }
          
            
            Text("Goal")
                .font(.body)
                .fontWeight(.semibold)
            
            TextField("Goal", value: $goal, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            Text("Frequency")
                .fontDesign(.rounded)
                .font(.body)
                .fontWeight(.semibold)
            
            HStack {
                TextField("Frequency", value: $frequency, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 80)
                    .keyboardType(.numberPad)
                
                Text("/")
                    .foregroundColor(.secondary)
                
                Picker("Goal Period", selection: $goalPeriod) {
                    ForEach(goalPeriods, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            ColorPicker("Set the background color", selection: $selectedColor, supportsOpacity: false)
                .fontDesign(.rounded)
                .font(.body)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    
    
    func addHabit() {
        if !habitTitle.isEmpty {
            
            modelContext.insert(
                Habit(
                    title: habitTitle,
                    details: habitDescription,
                    colorHex: selectedColor.toHexString() ?? "FFFFF",
                    goal: goal,
                    frequency: frequency,
                    goalPeriod: goalPeriod
                )
            )
        }
    }
}

#Preview {
    struct HabitDetailsPreview: View {
        @State private var isSheetVisible = true
        
        var body: some View {
            HabitDetailsView(
                isShowingSheet: $isSheetVisible
            )
        }
    }
    
    return HabitDetailsPreview()
}
