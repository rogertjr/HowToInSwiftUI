//
//  Post.swift
//  NetworkingSwiftUI
//
//  Created by Rogério Toledo on 08/01/21.
//

import SwiftUI

struct Post: Codable, Identifiable  {
    let id = UUID()
    var title: String
    var body: String
}
