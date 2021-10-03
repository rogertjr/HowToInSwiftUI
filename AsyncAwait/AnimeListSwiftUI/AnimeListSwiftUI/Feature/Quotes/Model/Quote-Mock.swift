//
//  Quote-Mock.swift
//  AnimeListSwiftUI
//
//  Created by Rogério Toledo on 26/09/21.
//

import Foundation

extension Quote {
    static let mock: [Quote] = [
        Quote.with(),
        Quote.with(anime: "Anime 2", character: "Character 2", quote: "Random Quote 2"),
        Quote.with(anime: "Anime 3", character: "Character 3", quote: "Random Quote 3"),
        Quote.with(anime: "Anime 4", character: "Character 4", quote: "Random Quote 4"),
    ]
    
    static func with(
        anime: String = "Anime 1",
        character: String = "Character 1",
        quote: String = "Random Quote 1"
    ) -> Quote {
        Quote(anime: anime,
              character: character,
              quote: quote)
    }
}
