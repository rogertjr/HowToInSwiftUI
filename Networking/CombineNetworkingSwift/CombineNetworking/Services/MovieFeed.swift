//
//  MovieFeed.swift
//  CombineNetworking
//
//  Created by Rogério Toledo on 10/01/21.
//

import Foundation

enum MovieFeed {
    case nowPlaying
    case topRated
}
extension MovieFeed: Endpoint {
    
    var base: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
            case .nowPlaying: return "/3/movie/now_playing"
            case .topRated: return "/3/movie/top_rated"
        }
    }
}
