//
//  CDViewModel.swift
//  Rehab-AI
//
//  Created by Rafael Negrete Leyva on 06/04/25.
//

import Foundation
import CoreData

class ProgressViewModel: ObservableObject {
    @Published var dailyGoalProgress: Double = 0.0

    private let context = CoreDataManager.shared.context

    func calculateProgress(for goal: Goal) {
        let logs = goal.logs as? Set<ExerciseLog> ?? []
        let totalMinutes = logs.reduce(0) { $0 + Int($1.duration) }
        let totalReps = logs.reduce(0) { $0 + Int($1.repetitions) }

        let minuteProgress = Double(totalMinutes) / Double(goal.targetMinutes)
        let repsProgress = Double(totalReps) / Double(goal.targetReps)

        dailyGoalProgress = min(1.0, (minuteProgress + repsProgress) / 2.0)
    }

    func fetchTodayGoal() -> Goal? {
        let request: NSFetchRequest<Goal> = Goal.fetchRequest()
        let today = Calendar.current.startOfDay(for: Date())

        request.predicate = NSPredicate(format: "date == %@", today as NSDate)

        return try? context.fetch(request).first
    }
}
