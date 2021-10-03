//
//  RegistrationService.swift
//  FirebaseAuthSwiftUI
//
//  Created by Rogério Toledo on 27/06/21.
//

import Combine
import Foundation
import Firebase
import FirebaseDatabase

enum RegistrationKeys: String {
    case firstName
    case lastName
    case occupation
}

protocol RegistrationServiceType {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>
}

final class RegistrationService: RegistrationServiceType {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth.auth()
                    .createUser(withEmail: details.email,
                                password: details.password) { response, error in
                        if let error = error {
                            promise(.failure(error))
                        } else {
                            if let uid = response?.user.uid {
                                let values = [RegistrationKeys.firstName.rawValue: details.firstName,
                                              RegistrationKeys.lastName.rawValue: details.lastName,
                                              RegistrationKeys.occupation.rawValue: details.occupation]
                                Database.database()
                                    .reference()
                                    .child("users")
                                    .child(uid)
                                    .updateChildValues(values) { error, reference in
                                        if let error = error {
                                            promise(.failure(error))
                                        } else {
                                            promise(.success(()))
                                        }
                                    }
                            } else {
                                promise(.failure(NSError(domain: "Invalid user", code: 0, userInfo: nil)))
                            }
                        }
                    }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
