//
//  ExerciseView.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/5/25.
//

import SwiftUI

struct ExerciseView: View {
    @StateObject private var motionManager = MotionManager()

    var body: some View {
        VStack {
            ArmFlexionView()
        }
        .onAppear {
            motionManager.startUpdates()
        }
        .onDisappear {
            motionManager.stopUpdates()
        }
    }
}

#Preview {
    ExerciseView()
}
