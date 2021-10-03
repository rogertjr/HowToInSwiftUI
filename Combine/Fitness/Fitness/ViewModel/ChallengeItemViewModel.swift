//
//  ChallengeItemViewModel.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import SwiftUI

struct ChallengeItemViewModel: Identifiable {
    private let challenge: Challenge
    
    var id: String {
        challenge.id!
    }
    
    var title: String {
        challenge.exercise.capitalized
    }
    
    var progressCircleViewModel: ProgressCircleViewModel {
        let dayNumer = daysFromStart + 1
        let message = isComplete ? "Done" : "Day \(dayNumer) of \(challenge.length)"
        
        return .init(title: "Day", message: message, percentageComplete: Double(dayNumer) / Double(challenge.length))
    }
    
    private var daysFromStart: Int {
        let startDate = Calendar.current.startOfDay(for: challenge.startDate)
        let toDate = Calendar.current.startOfDay(for: Date())
        
        guard let daysFromStart = Calendar.current.dateComponents([.day], from: startDate, to: toDate).day else { return 0}
        return abs(daysFromStart)
    }
    
    var isComplete: Bool {
        daysFromStart - challenge.length >= 0
    }
    
    var statusText: String {
        guard !isComplete else { return "Done" }
        let dayNumer = daysFromStart + 1
        return "Day \(dayNumer) of \(challenge.length)"
    }
    
    var increaseText: String {
        "+\(challenge.increase) daily"
    }
    
    var todayViewText: String {
        "Today"
    }
    
    var todayRepTitle: String {
        let repNumer = challenge.startAmount + (daysFromStart * challenge.increase)
        let exercise: String
        if repNumer == 1 {
            var challengeExercise = challenge.exercise
            challengeExercise.removeLast()
            exercise = challengeExercise
        } else {
            exercise = challenge.exercise
        }
        
        return isComplete ? "Completed" : "\(repNumer) " + exercise
    }
    
    var shouldShowTodayView: Bool {
        !isComplete
    }
    
    var isDayComplete: Bool {
        let today = Calendar.current.startOfDay(for: Date())
        return challenge.activities.first(where: { $0.date == today })?.isComplete == true
    }
    
    private let onDelete: (String) -> Void
    private let onToggleComplete: (String, [Activity]) -> Void
    
    init(_ challenge: Challenge, onDelete: @escaping (String) -> Void, onToggleComplete: @escaping (String, [Activity]) -> Void) {
        self.challenge = challenge
        self.onDelete = onDelete
        self.onToggleComplete = onToggleComplete
    }
    
    func tappedDelete() {
        if let id = challenge.id {
            onDelete(id)
        }
    }
    
    func send(action: Action) {
        guard let id = challenge.id else { return }
        switch action {
        case .delete:
            onDelete(id)
        case .toggleComplete:
            let today = Calendar.current.startOfDay(for: Date())
            let activities = challenge.activities.map { activity -> Activity in
                if today == activity.date {
                    return .init(date: today, isComplete: !activity.isComplete)
                } else {
                    return activity
                }
            }
            onToggleComplete(id, activities)
        }
    }
}

extension ChallengeItemViewModel {
    enum Action {
        case delete
        case toggleComplete
    }
}
