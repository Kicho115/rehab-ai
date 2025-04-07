//
//  UserTypeView.swift
//  Rehab-AI
//
//  Created by Rafael Negrete Leyva on 06/04/25.
//

import SwiftUI

struct UserTypeView: View {
    @ObservedObject var viewModel: SignUpViewModel

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Text("What kind of user you are?")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)

            VStack(spacing: 16) {
                Button(action: {
                    viewModel.userType = "Patient"
                }) {
                    Label("I am a Patient", systemImage: "person")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(viewModel.userType == "Patient" ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }

                Button(action: {
                    viewModel.userType = "Physiotherapist"
                }) {
                    Label("I am a Physiotherapist", systemImage: "stethoscope")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(viewModel.userType == "Physiotherapist" ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)

            NavigationLink("Next", destination: NameInputView(viewModel: viewModel))
                .disabled(viewModel.userType.isEmpty)
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
    UserTypeView(viewModel: SignUpViewModel())
}
