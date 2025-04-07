//
//  SignUpViewModel.swift
//  Rehab-AI
//
//  Created by Rafael Negrete Leyva on 06/04/25.
//

import Foundation
import CoreData

class SignUpViewModel: ObservableObject {
    @Published var name = ""
    @Published var userType = ""
    @Published var descriptionText = ""

    func saveUser() {
        let context = CoreDataManager.shared.context
        let user = User(context: context)
        user.id = UUID()
        user.name = name
        user.userType = userType
        user.descriptionText = descriptionText
        user.isLoggedIn = true

        CoreDataManager.shared.save()
    }
}
