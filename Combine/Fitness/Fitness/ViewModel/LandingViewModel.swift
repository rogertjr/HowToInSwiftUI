//
//  LandingViewModel.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import Foundation

class LandingViewModel: ObservableObject {
    @Published var loginSignUpPushed = false
    @Published var createPushed = false
    
    let title = "Increment"
    let createButtonTitle = "Create a Challenge"
    let createButtonImage = "plus.circle"
    let alreadyButtonTitle = "I already have an account"
    let backgroundImageName = "pullup"
}

