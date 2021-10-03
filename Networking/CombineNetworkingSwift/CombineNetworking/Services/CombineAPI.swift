//
//  CombineAPI.swift
//  CombineNetworking
//
//  Created by Rogério Toledo on 10/01/21.
//

import Foundation
import Combine

protocol CombineAPI {
   var session: URLSession { get }
   func execute<T>(_ request: URLRequest,
                   decodingType: T.Type,
                   queue: DispatchQueue,
                   retries: Int) -> AnyPublisher<T, Error> where T: Decodable
}

extension CombineAPI {
   
   func execute<T>(_ request: URLRequest,
                   decodingType: T.Type,
                   queue: DispatchQueue = .main,
                   retries: Int = 0) -> AnyPublisher<T, Error> where T: Decodable {
       
       return session.dataTaskPublisher(for: request)
           .tryMap {
               guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
                   throw APIError.responseUnsuccessful
               }
               return $0.data
           }
           .decode(type: T.self, decoder: JSONDecoder())
           .receive(on: queue)
           .retry(retries)
           .eraseToAnyPublisher()
   }
}
