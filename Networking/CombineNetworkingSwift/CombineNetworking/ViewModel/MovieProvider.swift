//
//  MovieProvider.swift
//  CombineNetworking
//
//  Created by Rogério Toledo on 10/01/21.
//

import Foundation
import Combine

class MoviesProvider: ObservableObject {
    
    // MARK:- Subscribers
    private var cancellable: AnyCancellable?
    
    // MARK:- Publishers
    @Published var movies: [MovieViewModel] = []

    // MARK:- Private properties
    private let client = MovieClient()
    
    init() {
        cancellable = client.getFeed(.nowPlaying)
            .sink(receiveCompletion: { _ in },
            receiveValue: {
                self.movies = $0.results.map { MovieViewModel(movie: $0) }
            })
    }
}
