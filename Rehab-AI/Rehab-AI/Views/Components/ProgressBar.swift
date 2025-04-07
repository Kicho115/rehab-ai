//
//  ProgressBar.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/5/25.
//

import SwiftUI

struct ProgressBar: View {
    let progress: CGFloat

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Weekly Progress")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
                Text("75%")
                    .font(.system(size: 16, weight: .bold))
            }
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(hex: "E5E5E5"))
                        .frame(height: 8)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(hex: "2DD4BF"))
                        .frame(width: geometry.size.width * progress, height: 8)
                }
            }
            .frame(height: 8)
            
            Text("Great progress! Keep up the momentum.")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color(hex: "666666"))
                                        .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}

#Preview {
    ProgressBar(progress: 0.75)
}
