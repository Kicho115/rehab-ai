//
//  Dashboard.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/4/25.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Header(userName: "Oscar", profileImage: Image(systemName: "person.fill"))
                    Spacer()
                }
                
                // Daily exercises
                VStack(alignment: .leading, spacing: 30) {
                    Text("Here are your daily exercises")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    DailyExercises()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                                
                // Recovery Dashboard
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Recovery Dashboard")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(hex: "1A1A1A"))
                        
                        Text("Your rehabilitation journey")
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "666666"))
                    }
                        ProgressBar(progress: 0.75)
                        .padding()
                        .background(.white)
                        .cornerRadius(16)
                }
                .padding(24)
                .background(Color(hex: "DDFFF3"))
                .cornerRadius(16)
            }
            NavigationLink(destination: ARViewContainerWrapper()) {
                HStack {
                        Text("AI Exercise Tracker")
                            .font(.title)
                            .bold()
                        Image(systemName: "chevron.right")
                            .font(.title)
                            .bold()
                    }
                    .padding()
                    .background(Color(hex: "#A7FFCC"))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    Dashboard()
}
