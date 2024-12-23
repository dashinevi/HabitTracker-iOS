//
//  OnboardingButtonView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 23/12/2024.
//

import SwiftUI

struct OnboardingButtonView: View {
    
    var buttonText: String
    var isEnabled: Bool
    var onPress: () -> Void
    
    var body: some View {
        Button(action: onPress) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.myPrimary.opacity(isEnabled ? 1 : 0.5))
                    .frame(height: 50)
                Text(buttonText)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
        }
        .disabled(!isEnabled)
    }
}


