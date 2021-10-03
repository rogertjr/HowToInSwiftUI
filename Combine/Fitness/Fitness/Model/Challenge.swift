//
//  Challenge.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import Foundation
import FirebaseFirestoreSwift

struct Challenge: Codable {
    @DocumentID var id: String?
    let exercise: String
    let startAmount: Int
    let increase: Int
    let length: Int
    let userUid: String
    let startDate: Date
    let activities: [Activity]
}

struct Activity: Codable {
    let date: Date
    let isComplete: Bool
}
