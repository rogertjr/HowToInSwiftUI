//
//  FeedItem.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 05/06/21.
//

import Foundation

protocol Feed {}

struct FeedItem: Identifiable {
    let id = UUID()
    let item: Feed
}

// MARK: - Dummy Data Model
extension FeedItem {
    
    static var dummyData: [FeedItem] {
        
        var feedItem = [FeedItem]()
        
        feedItem.append(FeedItem(item: UpcomingFeedItem(upcoming: UpcomingRoom.dummyData)))
        
        FeedRoom
            .dummyData
            .forEach { item in
                
                feedItem.append(FeedItem(item: RoomFeedItem(room: item)))
            }
        
        return feedItem
    }
}
