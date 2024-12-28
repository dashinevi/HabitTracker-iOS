//
//  OnboardingView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 19/12/2024.
//
import SwiftUI
import SwiftData

struct OnboardingView: View {
    
    @State private var currentPage = 0
    var onboarding: [Onboarding] = onboardingData
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    
    var body: some View {
        TabView (selection: $currentPage) {
            ForEach(0..<onboarding.count, id: \.self) { index in
                OnboardingPageView(
                    onboarding: onboarding[index],
                    showTextField: index == 1,
                    buttonText: index == 0 ? "Continue" : "Get Started",
                    buttonAction: {
                        if index == 0 {
                            withAnimation {
                                currentPage = 1
                            }
                        } else {
                            isOnboarding = false
                        }
                    }
                )
            }
        }
        .background(.white)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .padding(.vertical, 20)
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

