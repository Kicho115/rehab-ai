//
//  ArmFlexionView.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/5/25.
//

import SwiftUI

struct ArmFlexionView: View {
    @StateObject private var motionManager = MotionManager()
    @StateObject private var viewModel: ArmFlexionViewModel

    init() {
        let motion = MotionManager()
        _motionManager = StateObject(wrappedValue: motion)
        _viewModel = StateObject(wrappedValue: ArmFlexionViewModel(motionManager: motion))
    }

    var body: some View {
        VStack {
            Text("Repeticiones: \(viewModel.repetitions)")
            Button("Iniciar", action: viewModel.start)
            Button("Detener", action: viewModel.stop)
            ArmAnimation(pitch: $motionManager.pitch)
            RepsChart(viewModel: viewModel)
        }
    }
}

#Preview {
    let viewModel = ArmFlexionViewModel.withMockData()
    return ArmFlexionView()
        .environmentObject(viewModel)
}
