//
//  NewsService.swift
//  NewsApp
//
//  Created by Rogério Toledo on 04/06/21.
//

import Foundation
import Combine

protocol NewsServiceType {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, ApiError>
}

struct NewsService: NewsServiceType {
    
    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
    
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, ApiError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in ApiError.unknown }
            .flatMap { data, response -> AnyPublisher<NewsResponse, ApiError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: ApiError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    return Just(data)
                        .decode(type: NewsResponse.self, decoder: self.decoder)
                        .mapError { _ in ApiError.decodingError}
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: ApiError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
