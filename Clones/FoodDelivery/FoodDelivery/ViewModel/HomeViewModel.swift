//
//  HomeViewModel.swift
//  FoodDelivery
//
//  Created by Rogério Toledo on 10/01/21.
//

import SwiftUI

class HomeViewModel: ObservableObject{
    // MARK: - PROPERTIES
    @Published var offset: CGFloat = 0
    @Published var selectedtab = tabsItems.first!.tab
}
