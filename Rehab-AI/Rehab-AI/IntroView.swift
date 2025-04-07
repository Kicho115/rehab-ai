//
//  IntroView.swift
//  Rehab-AI
//
//  Created by Rafael Negrete Leyva on 06/04/25.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                // Puedes cambiar por una imagen si quieres
                Image(systemName: "figure.walk.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.purple)

                Text("Welcome to\nRehab AI")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .bold()

                Spacer()

                NavigationLink("Get Started") {
                    UserTypeView(viewModel: SignUpViewModel())
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
}

#Preview {
    IntroView()
}
