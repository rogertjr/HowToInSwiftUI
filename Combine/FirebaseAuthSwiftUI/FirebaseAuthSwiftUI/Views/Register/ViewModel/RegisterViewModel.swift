//
//  RegisterViewModel.swift
//  FirebaseAuthSwiftUI
//
//  Created by Rogério Toledo on 27/06/21.
//

import Foundation
import Combine

enum RegistrationState {
    case successfull
    case failed(error: Error)
    case na
}

protocol RegisterViewModelType {
    var service: RegistrationService { get }
    var state: RegistrationState { get }
    var userDetails: RegistrationDetails { get }
    var hasError: Bool { get }
    init(service: RegistrationService)
    func register()
}

final class RegisterViewModel: ObservableObject, RegisterViewModelType {
    
    var service: RegistrationService
    @Published var state: RegistrationState = .na
    var userDetails: RegistrationDetails = RegistrationDetails.new
    @Published var hasError: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegistrationService) {
        self.service = service
        setupErrorSubscriptions()
    }
    
    func register() {
        service
            .register(with: userDetails)
            .sink { [weak self] response in
                guard let self = self else { return }
                switch response {
                case .failure(let error):
                    self.state = .failed(error: error)
                default:
                    break
                }
            } receiveValue: { [weak self] in
                guard let self = self else { return }
                self.state = .successfull
            }
            .store(in: &subscriptions)
    }
}

private extension RegisterViewModel {
    func setupErrorSubscriptions() {
        $state
            .map { state -> Bool in
                switch state {
                case .successfull,
                     .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
}
