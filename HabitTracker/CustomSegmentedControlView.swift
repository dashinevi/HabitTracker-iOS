//
//  GoalPeriodPickerView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 22/12/2024.
//

import Foundation
import SwiftUI

struct CustomSegmentedControl: View {
    @Binding var selectedItem: GoalPeriods
    
    var body: some View {
        HStack {
            ForEach(GoalPeriods.allCases, id: \.rawValue) { goalPeriod in
                Text(goalPeriod.rawValue)
                    .font(.body)
                    .foregroundStyle(.white)
                    .padding(10)
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(selectedItem == goalPeriod ? Color.myPrimary : Color.mySecondary.opacity(0.5))
                        }
                        .animation(.bouncy, value: selectedItem)
                    }
                    .onTapGesture {
                        selectedItem = goalPeriod
                    }
            }
        }
        .padding(5)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.clear)
                .stroke(.secondary, lineWidth: 1)
        }
    }
}

enum GoalPeriods: String, CaseIterable {
    case Week = "Week"
    case Month = "Month"
    case Year = "Year"
}

#Preview {
    @Previewable @State var selectedItem = GoalPeriods.Week
    return CustomSegmentedControl(selectedItem: $selectedItem)
}
