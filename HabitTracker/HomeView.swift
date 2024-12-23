//
//  HomeView.swift
//  HabitTracker
//
//  Created by Diana Dashinevich on 16/12/2024.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("user_name") var name: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Hello, \(name.isEmpty ? "Friend" : name)!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.myPrimary)
                
                Text("How are you feeling today?")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
            
            ZStack (alignment: .top) {
                Image(.homeViewPic)
                    .resizable()
                    .scaledToFit()
               
                    HStack {
                        Spacer()
                        Text(Date.now, format: .dateTime.day().month().year())
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.mySecondary)
                    }
                    .padding(.horizontal)
            }
            
            Spacer()
                
            HabitsListView()
        }
    }
}

#Preview {
    HomeView(name: "$name")
}
