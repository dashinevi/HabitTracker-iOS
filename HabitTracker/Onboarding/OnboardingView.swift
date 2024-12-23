//
//  OnboardingView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 19/12/2024.
//
import SwiftUI
import SwiftData

//struct OnboardingView: View {
//    @AppStorage("user_name") var name: String = ""
//    var body: some View {
//        VStack {
//            Image(.onboardingPic2)
//                .resizable()
//                .scaledToFit()
//            Text("Your Habit Tracker")
//                .font(.title)
//                .fontWeight(.bold)
//                .padding(.vertical)
//            HStack {
//                Text("Success is the product of daily habits - not once-in-a-lifetime transformations")
//                    .multilineTextAlignment(.center)
//                    .frame(width: 300)
//            }
//            Text("James Clear, Atomic Habits")
//                .fontWeight(.thin)
//            Spacer()
//            TextField("What is your name?", text: $name)
//                .frame(width: 300, height: 50)
//                .overlay(RoundedRectangle(cornerRadius: 15)
//                    .stroke(.secondary, lineWidth: 1)
//                    .fill(.clear)
//                    .frame(width: 320, height: 50))
//                .submitLabel(.continue)
//                .onSubmit {
//                    // do the same as on press of "Get Started"
//                }
//                .padding()
//
//
//            ZStack {
//                RoundedRectangle(cornerRadius: 15)
//                    .fill(Color.myPrimary.opacity(name.isEmpty ? 0.5 : 1))
//                    .frame(width: 320, height: 50)
//                Button("Get started", action: {
//
//                })
//                .foregroundStyle(.white)
//                .fontWeight(.bold)
//                .disabled(name.isEmpty)
//            }
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    OnboardingView()
//}



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

