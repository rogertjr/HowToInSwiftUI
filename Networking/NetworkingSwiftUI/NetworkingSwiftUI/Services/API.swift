//
//  API.swift
//  NetworkingSwiftUI
//
//  Created by Rogério Toledo on 08/01/21.
//

import Foundation

class API {
    func getAllPosts(completion: @escaping ([Post]) -> ()) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("URL Incorreta!!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
    }
}
