//
//  PostLisViewModel.swift
//  NetworkingSwiftUI
//
//  Created by Rogério Toledo on 08/01/21.
//

import Foundation
import SwiftUI
import Combine

class PostListViewModel: ObservableObject {
    
    @Published var posts: [Post] = []

    init() {
        fetchPosts()
    }
}

extension PostListViewModel {
    func fetchPosts(){
        API().getAllPosts {
            self.posts = $0
        }
    }
    
}
