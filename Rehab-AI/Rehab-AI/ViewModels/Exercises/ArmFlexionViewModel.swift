//
//  ArmFlexionViewModel.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/5/25.
//

import Foundation
import Combine

class ArmFlexionViewModel: ObservableObject {
    @Published var repetitions = 0
    @Published var progressData: [RepData] = []
    private var state: State = .waitingDown
    private var cancellables = Set<AnyCancellable>()

    private var motionManager: MotionManager

    init(motionManager: MotionManager) {
        self.motionManager = motionManager

        // Suscribirse a cambios en el pitch
        motionManager.$pitch
            .receive(on: RunLoop.main)
            .sink { [weak self] pitch in
                self?.handlePitch(pitch)
            }
            .store(in: &cancellables)
    }

    func start() {
        motionManager.startUpdates()
    }

    func stop() {
        motionManager.stopUpdates()
    }

    // Manejar el estado de la flexión del brazo
    private func handlePitch(_ pitch: Double) {
        switch state {
        case .waitingDown:
            if pitch < 0.3 {
                state = .goingUp
            }

        case .goingUp:
            if pitch > 1.0 {
                state = .atTop
            }

        case .atTop:
            if pitch < 0.3 {
                repetitions += 1
                addRepDataPoint()
                state = .goingUp
            }
        }
    }

    private func addRepDataPoint() {
        let newPoint = RepData(time: Date(), reps: repetitions)
        progressData.append(newPoint)
    }

    enum State {
        case waitingDown
        case goingUp
        case atTop
    }
}

struct RepData: Identifiable {
    let id = UUID()
    let time: Date
    let reps: Int
}

extension ArmFlexionViewModel {
    static func withMockData() -> ArmFlexionViewModel {
        let viewModel = ArmFlexionViewModel(motionManager: MotionManager())
        viewModel.repetitions = 10
        viewModel.progressData = [
            RepData(time: Date().addingTimeInterval(-60), reps: 1),
            RepData(time: Date().addingTimeInterval(-50), reps: 2),
            RepData(time: Date().addingTimeInterval(-40), reps: 3),
            RepData(time: Date().addingTimeInterval(-30), reps: 4),
            RepData(time: Date().addingTimeInterval(-20), reps: 5),
            RepData(time: Date().addingTimeInterval(-10), reps: 6),
            RepData(time: Date(), reps: 7)
        ]
        return viewModel
    }
}
