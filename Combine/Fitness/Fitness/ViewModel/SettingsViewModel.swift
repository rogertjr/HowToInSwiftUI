//
//  SettingsViewModel.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import Combine
import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published private(set) var itemViewModels: [SettingsItemViewModel] = []
    @Published var loginSignUpPushed = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    private let userService: UserServiceProtocol
    private var cancellables: [AnyCancellable] = []
    
    init(userService: UserServiceProtocol = UserService()){
        self.userService = userService
    }
    
    let title: String = "Settings"
    
    func item(at index: Int) -> SettingsItemViewModel {
        itemViewModels[index]
    }
    
    func tappedItem(at index: Int){
        switch itemViewModels[index].type {
        case .account:
            guard userService.currentUser?.email == nil else { return }
            loginSignUpPushed = true
        case .mode:
            isDarkMode = !isDarkMode
            buildItems()
        case .logout:
            userService
                .logout()
                .sink { (completion) in
                    switch completion {
                    case let .failure(error):
                        print(error.localizedDescription)
                    case .finished:
                        break
                    }
                } receiveValue: { _ in }
                .store(in: &cancellables)

        default:
            break
        }
    }
    
    private func buildItems() {
        itemViewModels = [
            .init(title: userService.currentUser?.email ?? "Create Account", iconName: "person.circle", type: .account),
            .init(title: "Switch to \(isDarkMode ? "Light" : "Dark") Mode", iconName: "lightbulb", type: .mode),
            .init(title: "Privacy Policy", iconName: "shield", type: .privacy),
        ]
        
        if userService.currentUser?.email != nil{
            itemViewModels += [.init(title: "Logout", iconName: "arrowshape.turn.up.left", type: .logout)]
        }
    }
    
    func onAppear() {
        buildItems()
    }
}
