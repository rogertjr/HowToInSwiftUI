//
//  ResultState.swift
//  NewsApp
//
//  Created by Rogério Toledo on 04/06/21.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
