//
//  LoginService.swift
//  FirebaseAuthSwiftUI
//
//  Created by Rogério Toledo on 27/06/21.
//

import Combine
import Foundation
import FirebaseAuth

protocol LoginServiceType {
    func login(with credential: LoginCredentials) -> AnyPublisher<Void, Error>
}

final class LoginService: ObservableObject, LoginServiceType {
    
    func login(with credential: LoginCredentials) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth.auth()
                    .signIn(withEmail: credential.email, password: credential.password) { response, error in
                        if let error = error {
                            promise(.failure(error))
                        } else {
                            promise(.success(()))
                        }
                    }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
