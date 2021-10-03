//
//  ForgotPasswordService.swift
//  FirebaseAuthSwiftUI
//
//  Created by Rogério Toledo on 27/06/21.
//

import Combine
import Foundation
import FirebaseAuth

protocol ForgotPasswordServiceType {
    func sendPasswordReset(to email: String) -> AnyPublisher<Void, Error>
}

final class ForgotPasswordService: ObservableObject, ForgotPasswordServiceType {
    
    func sendPasswordReset(to email: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth.auth()
                    .sendPasswordReset(withEmail: email) { error in
                        if let error = error {
                            promise(.failure(error))
                        } else {
                            promise(.success(()))
                        }
                    }
            }
        }
        .eraseToAnyPublisher()
    }
}
