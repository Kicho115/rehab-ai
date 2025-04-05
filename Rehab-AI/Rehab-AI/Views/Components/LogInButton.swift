//
//  LogInButton.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/3/25.
//
import SwiftUI

struct LogInButton: View {
    var text: String
    var description: String
    var icon: Image?

    var body: some View {
        Button(action: {
            // Action to perform when button is tapped
        }) {
            HStack() {
                if let icon = icon {
                    icon
                }
                VStack(alignment: .leading) {
                    Text(text)
                    Text(description)
                }
            }
            .font(.headline)
            .padding()
            .background(Color(hex: "#94E8B4"))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .frame(maxWidth: 250, alignment: .leading)

    }
}

#Preview {
    LogInButton(text: "Log In", description: "Log in as a patient", icon: Image(systemName: "person.fill"))
}
