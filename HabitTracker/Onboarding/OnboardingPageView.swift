//
//  OnboardingPageView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 23/12/2024.
//

import SwiftUI

struct OnboardingPageView: View {
    
    @AppStorage("user_name") var name: String = ""
    
    var onboarding: Onboarding
    var showTextField: Bool
    var buttonText: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            VStack {
                Image(onboarding.image)
                    .resizable()
                    .scaledToFit()
                HStack {
                    Text(onboarding.title)
                        .foregroundColor(.myPrimary)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    Text(onboarding.headline)
                        .padding(.vertical)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                if showTextField {
                    TextField("What is your name?", text: $name)
                        .frame(width: 300, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(.secondary, lineWidth: 1)
                            .fill(.clear)
                            .frame(width: 320, height: 50))
                        .padding(.vertical)
                    
                }
                Spacer()
                
                OnboardingButtonView(
                    buttonText: buttonText,
                    isEnabled: showTextField ? !name.isEmpty : true,
                    onPress: buttonAction
                )
            }
            .padding(.horizontal, 40)
        }
    }
}


