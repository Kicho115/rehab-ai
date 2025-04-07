//
//  DailyExercises.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/4/25.
//

import SwiftUI

struct DailyExercises: View {
    @State private var selectedExercise: ExerciseOption?

    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(ExerciseOption.allCases) { exercise in
                        NavigationLink(
                            destination: exercise.destinationView,
                            isActive: Binding(
                                get: { selectedExercise == exercise },
                                set: { if !$0 { selectedExercise = nil } }
                            )
                        ) {
                            Button(action: {
                                selectedExercise = exercise
                            }) {
                                VStack {
                                    Image(systemName: exercise.iconName)
                                        .font(.system(size: 50)) // Adjust icon size
                                        .padding(10)
                                        .foregroundColor(Color(hex: exercise.iconColor))
                                        .background(Color(hex: exercise.iconBackgroundColor))
                                        .cornerRadius(30)
                                        .padding(10)
                                        .background(Color(hex: "#FFFFFF"))
                                        .cornerRadius(20)

                                    Text(exercise.name)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                }
                            }
                            .buttonStyle(PlainButtonStyle()) // Remove default button style
                        }
                    }
                }
                .padding()
            }
            .background(Color(hex: "#F8F7F7"))
            .cornerRadius(20)
        }
    }
}

#Preview {
    DailyExercises()
}
