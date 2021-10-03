//
//  MovieRow.swift
//  CombineNetworking
//
//  Created by Rogério Toledo on 10/01/21.
//

import SwiftUI
import Combine

struct MovieRow: View {
    
    // MARK:- Dependency injection
    let movie: MovieViewModel
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            ImageViewCache(urls: (urlString: movie.posterPathHighResURLString, lowResURLString: movie.posterPathLowResURLString), errorImage: UIImage(systemName: "pause.rectangle.fill"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 150)
            
            VStack(alignment: .leading, spacing: 10.0) {
                Text(movie.title)
                    .font(.system(size: 20, weight: .bold))
                
                Text(movie.overview)
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                
                Text(movie.releaseDate)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
        }
        .padding(12)
    }
}
