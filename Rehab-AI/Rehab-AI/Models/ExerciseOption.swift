//
//  ExerciseOption.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/5/25.
//

import SwiftUI

enum ExerciseOption: String, CaseIterable, Identifiable {
    case armFlexion, legExtension

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .armFlexion:
            return "figure.martial.arts" // Nombre del icono
        case .legExtension:
            return "figure.kickboxing" // Nombre del icono
        }
    }
    
    var iconColor: String {
        switch self {
        case .armFlexion:
            return "1089FF" // Nombre del icono
        case .legExtension:
            return "FBD53D" // Nombre del icono
        }
    }
    
    var iconBackgroundColor: String {
        switch self {
        case .armFlexion:
            return "CFE7FF" // Nombre del icono
        case .legExtension:
            return "FEF7D8" // Nombre del icono
        }
    }
    
    var name: String {
        switch self {
        case .armFlexion:
            return "Arm Flexion" // Nombre del icono
        case .legExtension:
            return "Leg Extension" // Nombre del icono
        }
    }

    @ViewBuilder
    var destinationView: some View {
        switch self {
        case .armFlexion:
            ArmFlexionView()
        case .legExtension:
            ArmFlexionView() // Cambia esto por la vista correspondiente
        }
    }
}
