//
//  ProgressView.swift
//  Rehab-AI
//
//  Created by Rafael Negrete Leyva on 06/04/25.
//

import SwiftUI

struct GoalProgressView: View {
    @StateObject var viewModel = ProgressViewModel()

    var body: some View {
        VStack {
            ProgressView("Progreso Diario", value: viewModel.dailyGoalProgress)
                .padding()

            Button("Actualizar progreso") {
                if let goal = viewModel.fetchTodayGoal() {
                    viewModel.calculateProgress(for: goal)
                }
            }
        }
    }
}
