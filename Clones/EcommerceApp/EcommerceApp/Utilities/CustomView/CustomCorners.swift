//
//  CustomCorners.swift
//  EcommerceApp
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

struct CustomCorners: Shape {
    // MARK: - Properties
    var corners: UIRectCorner
    var radius: CGFloat
    
    // MARK: - Functions
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
