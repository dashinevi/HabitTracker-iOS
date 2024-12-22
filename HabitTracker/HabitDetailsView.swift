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
    @State private var frequency: Int = 0
    @State private var goalPeriod: GoalPeriods = .Week
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
                    frequency = 0
                    goalPeriod = .Week
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
            
            VStack(alignment: .leading) {
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
                
                Text("Goal & Goal Period")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.myPrimary)
                    .padding(.vertical)
                
                
                HStack {
                    TextField("Goal", value: $frequency, format: .number)
                        .frame(width: 35)
                        .padding(.horizontal)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(.secondary, lineWidth: 1)
                            .fill(.clear)
                            .frame(height: 50))
                        .keyboardType(.numberPad)
                    Spacer()
                    Text("times per")
                        .foregroundColor(.secondary)
                        .font(.callout)
                    Spacer()
                    
                    CustomSegmentedControl(selectedItem: $goalPeriod)
    
                }
                Text("*Complete \(frequency) times every \(goalPeriod)")
                    .font(.caption)
                    .padding(.vertical, 5)
            }
            ColorPicker("Set the background color", selection: $selectedColor, supportsOpacity: false)
                .foregroundStyle(.myPrimary)
                .font(.body)
                .fontWeight(.semibold)
                .padding(.vertical)
            
            Spacer()
            
            Image(.habitDetailsPic)
                .resizable()
                .scaledToFit()
            
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
//                    goal: goal,
                    frequency: frequency,
                    goalPeriod: goalPeriod.rawValue
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
