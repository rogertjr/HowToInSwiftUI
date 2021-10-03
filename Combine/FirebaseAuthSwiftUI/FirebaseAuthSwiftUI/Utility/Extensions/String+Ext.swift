//
//  String+Ext.swift
//  FirebaseAuthSwiftUI
//
//  Created by Rogério Toledo on 27/06/21.
//

import UIKit

extension Optional where Wrapped == String {

    var isNilOrEmpty: Bool {
        get {
            if let string = self {
                return string.isEmpty || string == " "
            }
            return true
        }
    }
}
