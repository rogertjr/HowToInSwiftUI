//
//  ProgressCircleViewModel.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import Foundation

struct ProgressCircleViewModel {
    let title: String
    let message: String
    let percentageComplete: Double
    
    var shouldShowTitle: Bool {
        percentageComplete <= 1
    }
}
