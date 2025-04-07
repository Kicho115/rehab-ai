//
//  RepsChart.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/6/25.
//

import SwiftUI
import Charts

struct RepsChart: View {
    @ObservedObject var viewModel: ArmFlexionViewModel

    var body: some View {
        Chart {
            ForEach(viewModel.progressData) { dataPoint in
                LineMark(
                    x: .value("Time", dataPoint.time),
                    y: .value("Reps", dataPoint.reps)
                )
            }
        }
        .padding()
    }
}

#Preview {
    RepsChart(viewModel: ArmFlexionViewModel(motionManager: MotionManager()))
}
