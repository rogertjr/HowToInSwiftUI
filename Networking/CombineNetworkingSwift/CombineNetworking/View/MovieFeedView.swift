//
//  MovieFeedView.swift
//  CombineNetworking
//
//  Created by Rogério Toledo on 10/01/21.
//

import SwiftUI

struct MovieFeedView: View {
    @StateObject private var model = MoviesProvider()
    
    var body: some View {
        NavigationView {
            List(model.movies, id: \.id) { movie in
                MovieRow(movie: movie)
            }
        }
    }
}

struct MovieFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MovieFeedView()
    }
}
