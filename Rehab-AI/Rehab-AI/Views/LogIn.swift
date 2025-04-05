//
//  LogIn.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/2/25.
//

import SwiftUI

struct LogIn: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color(hex: "#94E8B4"))
                    .mask(LinearGradient(gradient: Gradient(stops: [
                                .init(color: .black, location: 0),
                                .init(color: .clear, location: 1)
                            ]), startPoint: .top, endPoint: .bottom))
                    .ignoresSafeArea()
            
                Image(.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.top, 50)
            }
            Text("Welcome to Rehab-AI")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Text("Your personal AI-powered rehabilitation companion")
                .font(.subheadline)
                .padding(.top, 10)
            Spacer()
            
            LogInButton(text: "I'm a Patient", description: "Get personalized rehabilitation exercises", icon: Image(systemName: "person.fill"))
            LogInButton(text: "I'm a Physiotherapist", description: "Monitor and guide patient recovery", icon: Image(systemName: "person.fill.badge.plus"))
                
        }
    }
}

#Preview {
        LogIn()
}
