//
//  ForgotPasswordViewModel.swift
//  FirebaseAuthSwiftUI
//
//  Created by Rogério Toledo on 27/06/21.
//

import Foundation
import Combine

protocol ForgotPasswordViewModelType {
    var service: ForgotPasswordService { get }
    var email: String { get }
    init(service: ForgotPasswordService)
    func sendPasswordReset()
}

final class ForgotPasswordViewModel: ObservableObject, ForgotPasswordViewModelType {
    
    var service: ForgotPasswordService
    @Published var email: String = ""
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: ForgotPasswordService) {
        self.service = service
    }
    
    func sendPasswordReset() {
        service
            .sendPasswordReset(to: email)
            .sink { response in
                switch response {
                case .failure(let error):
                    print(error)
                default:
                    break
                }
            } receiveValue: {
                print("Password sent via email")
            }
            .store(in: &subscriptions)
    }
}
