//
//  SettingsItemViewModel.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import Foundation

extension SettingsViewModel{
    struct SettingsItemViewModel {
        let title: String
        let iconName: String
        let type: SettingsITemType
    }
    
    enum SettingsITemType{
        case account
        case mode
        case privacy
        case logout
    }
}
