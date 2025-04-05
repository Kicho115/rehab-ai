//
//  Dashboard.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/4/25.
//

import SwiftUI

struct Dashboard: View {
    
    var body: some View {
        VStack {
            HStack {
                Header(userName: "Oscar", profileImage: Image(systemName: "person.fill"))
                Spacer()
            }
            Text("Here are your daily exercises")
                .font(.largeTitle)
                .padding()
            DailyExercises(exercises: ["Sexercise 1", "Exercise 2", "Exercise 3"])
                .padding()
            // Recovery dashboard
            RecoveryProgress()
            Spacer()
        }
    }
}

#Preview {
    Dashboard()
}
