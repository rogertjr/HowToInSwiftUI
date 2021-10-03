//
//  Endpoint.swift
//  CombineNetworking
//
//  Created by Rogério Toledo on 10/01/21.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
}
extension Endpoint {
    var apiKey: String {
        return "api_key=4fdd8a236f643cd5e72ebf6a599b9733"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = apiKey
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}
