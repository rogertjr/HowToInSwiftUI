//
//  MovieClient.swift
//  CombineNetworking
//
//  Created by Rogério Toledo on 10/01/21.
//

import Foundation
import Combine

class MovieClient: CombineAPI {
   let session: URLSession
   
   init(configuration: URLSessionConfiguration) {
       self.session = URLSession(configuration: configuration)
   }
   
   convenience init() {
       self.init(configuration: .default)
   }
   
   func getFeed(_ feedKind: MovieFeed) -> AnyPublisher<MovieFeedResult, Error> {
       execute(feedKind.request, decodingType: MovieFeedResult.self, retries: 2)
   }
}
