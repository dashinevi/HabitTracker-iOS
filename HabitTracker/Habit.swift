//
//  Habit.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 18/12/2024.
//
import Foundation
import SwiftData
import SwiftUI

@Model
class Habit {
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    var details: String?
    var colorHex: String
    var frequency: Int
    var goalPeriod: String
    var completedDates: [Date]
    
    init(title: String, details: String? = nil, colorHex: String, /*goal: Int,*/ frequency: Int, goalPeriod: String, completedDates: [Date] = []) {
        self.title = title
        self.details = details
        self.colorHex = colorHex
        self.frequency = frequency
        self.goalPeriod = goalPeriod
        self.completedDates = completedDates
    }
}
