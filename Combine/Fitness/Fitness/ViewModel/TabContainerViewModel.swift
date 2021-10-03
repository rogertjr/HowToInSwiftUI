//
//  TabContainerViewModel.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import SwiftUI

class TabContainerViewModel: ObservableObject {
    @Published var selectedTab: TabItemViewModel.TabItemType = .challengeList
    
    let tabItemViewModels = [
        TabItemViewModel(imageName: "book", title: "Activity", type: .log),
        TabItemViewModel(imageName: "list.bullet", title: "Challenges", type: .challengeList),
        TabItemViewModel(imageName: "gear", title: "Setting", type: .settings)
    ]
}
