//
//  LoginSignUpViewModel.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import SwiftUI
import Combine

class LoginSignUpViewModel: ObservableObject {
    private let mode: Mode
    
    @Published var email = ""
    @Published var password = ""
    @Published var isValid =  false
    
    @Binding var isPushed: Bool
    
    private let userService: UserServiceProtocol
    private var cancellables: [AnyCancellable] = []
    
    private(set) var emailPlaceholderText = "Email"
    private(set) var passwordPlaceholderText = "Password"
    
    init(mode: Mode, userService: UserServiceProtocol = UserService(), isPushed: Binding<Bool>){
        self.mode = mode
        self.userService = userService
        self._isPushed = isPushed
        
        Publishers.CombineLatest($email, $password)
            .map { [weak self] email, password in
                return self?.isValidEmail(email) == true && self?.isValidPassword(password) == true
            }
            .assign(to: &$isValid)
    }
    
    var title: String {
        switch mode {
        case .login:
            return "Welcome back!"
        case .signup:
            return "Create an Account"
        }
    }
        
    var subtitle: String {
        switch mode {
        case .login:
            return "Login with your email"
        case .signup:
            return "Signup via email"
        }
    }
    
    var buttonTitle: String {
        switch mode {
        case .login:
            return "Login"
        case .signup:
            return "Signup"
        }
    }
    
    func tappedActionButton() {
        switch mode {
        case .login:
            userService
                .login(email: email, password: password)
                .sink { (completion) in
                    switch completion {
                    case let .failure(error):
                        print(error.localizedDescription)
                    case .finished:
                        break
                    }
                } receiveValue: { _ in }
                .store(in: &cancellables)

            
        case .signup:
            userService.linkAccount(email: email, password: password)
                .sink { [weak self] (completion) in
                    switch completion {
                    case let .failure(error):
                        print(error.localizedDescription)
                    case .finished:
                        self?.isPushed = false
                        print("finished")
                    }
                } receiveValue: { _ in }
                .store(in: &cancellables)
        }
    }
}

extension LoginSignUpViewModel {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email) && email.count > 5
    }
    
    func isValidPassword(_ password: String) -> Bool {
        return password.count > 5
    }
}

extension LoginSignUpViewModel {
    enum Mode {
        case login
        case signup
    }
}
