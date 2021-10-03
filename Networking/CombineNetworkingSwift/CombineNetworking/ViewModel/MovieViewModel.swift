//
//  MovieViewModel.swift
//  CombineNetworking
//
//  Created by Rogério Toledo on 10/01/21.
//

import SwiftUI

struct MovieViewModel: Identifiable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let posterPathHighResURLString: String
    let posterPathLowResURLString: String
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.overview = movie.overview ?? "Not available overview"
        self.releaseDate = movie.releaseDate ?? "Not available date"
        self.posterPathHighResURLString = "https://image.tmdb.org/t/p/w500" + (movie.posterPath ?? "")
        self.posterPathLowResURLString = "https://image.tmdb.org/t/p/w200" + (movie.posterPath ?? "")
    }
}
