//
//  Article.swift
//  NewsApp
//
//  Created by Rogério Toledo on 04/06/21.
//

import Foundation

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let articleDescription: String?
    let image: String?
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: Article {
        .init(author: "Jackie Wattles, CNN Business",
              url: "https://edition.cnn.com/2021/06/04/tech/ufos-nasa-study-scn/index.html",
              source: "CNN",
              title: "NASA is getting serious about UFOs - CNN",
              articleDescription: "NASA's new chief is setting up an effort to further study unidentified flying objects within his first month in office.",
              image: "https://cdn.cnn.com/cnnnext/dam/assets/210519133725-ufo-us-navy-corbell-1-super-tease.jpg",
              date: Date())
    }
}
