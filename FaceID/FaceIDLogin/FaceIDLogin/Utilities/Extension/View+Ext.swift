//
//  View+Ext.swift
//  FaceIDLogin
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

// MARK: UI Designing
extension View {
    ///
    func hLeading() -> some View {
        self.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    ///
    func hTrailing() -> some View {
        self.frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    ///
    func hCenter() -> some View {
        self.frame(maxWidth: .infinity, alignment: .center)
    }
}
