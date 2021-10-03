//
//  QuotesService.swift
//  AnimeListSwiftUI
//
//  Created by Rogério Toledo on 26/09/21.
//

import Foundation

enum QuotesServiceError: Error {
    case failed
    case failedToDecode
    case invalidStatusCode
}

protocol QuotesServiceType {
    func fetchRandomQuotes() async throws -> [Quote]
}

@MainActor
final class QuotesService: QuotesServiceType {
    /// Gets a random quote
    func fetchRandomQuotes() async throws -> [Quote] {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseUrl.appending("/api/quotes"))
        let (data, response) = try await urlSession.data(from: url!)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw QuotesServiceError.invalidStatusCode
              }
        
        return try JSONDecoder().decode([Quote].self, from: data)
    }
}
