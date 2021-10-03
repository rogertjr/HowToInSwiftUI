//
//  LoginCredentials.swift
//  FirebaseAuthSwiftUI
//
//  Created by Rogério Toledo on 27/06/21.
//

import Foundation

struct LoginCredentials {
    var email: String
    var password: String
}

extension LoginCredentials {
    static var new: LoginCredentials {
        LoginCredentials(email: "",
                         password: "")
    }
}
