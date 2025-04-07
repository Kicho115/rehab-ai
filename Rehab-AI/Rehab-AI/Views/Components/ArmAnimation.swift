//
//  ArmAnimation.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/6/25.
//

import SwiftUI

struct ArmAnimation: View {
    @Binding var pitch: Double

    var body: some View {
        VStack {
            Image(systemName: "hand.raised.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(pitch * 90)) // Ajusta el ángulo según el pitch
                .animation(.easeInOut, value: pitch)
            Text("Pitch: \(pitch, specifier: "%.2f")")
        }
    }
}
