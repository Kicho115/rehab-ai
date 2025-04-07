//
//  DescriptionView.swift
//  Rehab-AI
//
//  Created by Rafael Negrete Leyva on 06/04/25.
//

import SwiftUI

struct DescriptionView: View {
    @ObservedObject var viewModel: SignUpViewModel

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Text("Describe your situation and physiotherapy goals")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)

            TextEditor(text: $viewModel.descriptionText)
                .frame(height: 150)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)

            NavigationLink("Next", destination: LoginView(viewModel: viewModel))
                .disabled(viewModel.descriptionText.isEmpty)
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
    let vm = SignUpViewModel()
    vm.name = "Rafael"
    return DescriptionView(viewModel: vm)
}
