//
//  NameInputView.swift
//  Rehab-AI
//
//  Created by Rafael Negrete Leyva on 06/04/25.
//

import SwiftUI

struct NameInputView: View {
    @ObservedObject var viewModel: SignUpViewModel

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Text("Hi, what's your name?")
                .font(.title2)
                .bold()

            TextField("Enter your name", text: $viewModel.name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            NavigationLink("Next", destination: DescriptionView(viewModel: viewModel))
                .disabled(viewModel.name.isEmpty)
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
    vm.userType = "Patient"
    return NameInputView(viewModel: vm)
}
