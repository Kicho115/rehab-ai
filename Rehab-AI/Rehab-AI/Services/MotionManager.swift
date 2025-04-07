//
//  MotionManager.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/5/25.
//

import CoreMotion

class MotionManager: ObservableObject {
    private var motionManager = CMMotionManager()
    @Published var pitch: Double = 0.0 // Inclinacion
    @Published var roll: Double = 0.0
    @Published var yaw: Double = 0.0

    func startUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.02
            motionManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, error in
                guard let self = self, let motion = motion, error == nil else { return }

                self.pitch = motion.attitude.pitch
                self.roll = motion.attitude.roll
                self.yaw = motion.attitude.yaw

                // 👇 Imprime la posición cada vez que cambia
                print(String(format: "Pitch: %.2f, Roll: %.2f, Yaw: %.2f",
                             self.pitch, self.roll, self.yaw))
            }
        }
    }

    func stopUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
}
