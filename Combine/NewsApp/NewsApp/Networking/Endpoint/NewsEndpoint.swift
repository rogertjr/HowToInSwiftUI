//
//  NewsEndpoint.swift
//  NewsApp
//
//  Created by Rogério Toledo on 04/06/21.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path:String { get }
}

enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {
    var urlRequest: URLRequest {
        URLRequest(url: baseUrl.appendingPathComponent(path))
    }
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: NEWS_API_BASE_URL)!
        }
    }
    
    var path: String {
        NEWS_PATH
    }
}
