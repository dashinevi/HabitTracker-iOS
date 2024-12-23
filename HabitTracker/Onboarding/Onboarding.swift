//
//  OnboardingViewPage1.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 23/12/2024.
//

import SwiftUI
import Foundation

struct Onboarding: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
}

let onboardingData: [Onboarding] = [
    Onboarding(
      title: "The best time to start is now!",
      headline: "Challenge yourself, track your progress, and celebrate success",
      image: "OnboardingPic1"
      
    ),
    Onboarding(
      title: "Your Habit Tracker",
      headline: "Success is the product of daily habits - not once-in-a-lifetime transformations",
      image: "OnboardingPic2"
      
    )
  ]


