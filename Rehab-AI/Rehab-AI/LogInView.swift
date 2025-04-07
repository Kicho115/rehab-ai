//
//  LogInView.swift
//  Rehab-AI
//
//  Created by Rafael Negrete Leyva on 06/04/25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: SignUpViewModel

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Text("Let's start our journey!")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)

            Image(systemName: "mountain.2.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)

            Button("Continue") {
                viewModel.saveUser()
                // Aquí puedes hacer navegación adicional si quieres
            }
            .font(.title2)
            .padding(.horizontal, 40)
            .padding(.vertical, 12)
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    let viewModel = SignUpViewModel()
    viewModel.name = "Rafael"
    viewModel.userType = "Patient"
    viewModel.descriptionText = "Rehab for knee"
    return LoginView(viewModel: viewModel)
}
