//
//  Person.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 05/06/21.
//

import Foundation

struct Person: Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let img: String?
    let state: Set<RoomState>
}
