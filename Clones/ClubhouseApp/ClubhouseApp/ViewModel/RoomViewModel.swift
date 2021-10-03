//
//  RoomViewModel.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 05/06/21.
//

import Foundation

class RoomViewModel: ObservableObject {
    
    private(set) var activeRoom: FeedRoom = FeedRoom.dummyData[0]
    
    func setActive(_ room: FeedRoom) {
        self.activeRoom = room
    }
}
