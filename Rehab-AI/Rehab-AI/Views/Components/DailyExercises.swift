//
//  DailyExercises.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/4/25.
//

import SwiftUI

struct DailyExercises: View {
    @State var exercises: [String] 

    var body: some View {
        VStack {
            ForEach(exercises, id: \.self) { task in
                Text(task)
                    .font(.headline)
            }
        }
    }
}
