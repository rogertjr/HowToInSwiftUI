//
//  RoomView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 05/06/21.
//

import SwiftUI

struct RoomView: View {
    // MARK: - Properties
    let feedRoom: FeedRoom
    private let hostPicSize: CGFloat = 38
    
    // MARK: - Views
    var body: some View {
        VStack(alignment: .leading) {
            if let groupName = feedRoom.groupName {
                CurrentGroupView(groupName: groupName)
            }
            
            Text(feedRoom.roomName)
                .font(Font.Nunito.bold(size: 16))
                .foregroundColor(DSSettings.Colors.textBlack)
            
            HStack(alignment: .top) {
                if feedRoom.hostPics.count > 1 {
                    FeedPictureView(picture: feedRoom.hostPics.first!)
                        .overlay(FeedPictureView(picture: feedRoom.hostPics.last!).offset(x: 16, y: 16))
                } else {
                    FeedPictureView(picture: feedRoom.hostPics.first!)
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    ForEach(feedRoom.participants, id: \.self) { person in
                        Text("\(person) 💬")
                    }
                    .font(Font.Nunito.bold(size: 16))
                    .foregroundColor(DSSettings.Colors.textBlack)
                    
                    HStack(spacing: 3) {
                        Text(feedRoom.numOfParticipants.description)
                            .padding(.trailing, 5)
                        DSSettings.Images.person
                        Text("/")
                            .padding(.horizontal, 5)
                        Text(feedRoom.numOfHosts.description)
                            .padding(.trailing, 5)
                        DSSettings.Images.chatBubble
                    }
                    .font(Font.Nunito.semiBold(size: 14))
                    .foregroundColor(DSSettings.Colors.customGrey)
                }
                .padding(.leading, 30)
            }
        }
        .padding(.vertical, 17)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(DSSettings.Colors.cardBackground)
        .cornerRadius(19)
        .shadow(color: DSSettings.Colors.cardShadowTint, radius: 1, x: 0, y: 1)
        .padding(.horizontal, 15)
    }
}

// MARK: - Properties
struct FeedPictureView: View {
    // MARK: - Properties
    private let hostPicSize: CGFloat = 38
    let picture: String
    // MARK: - Views
    var body: some View {
        Image(picture)
            .resizable()
            .frame(width: hostPicSize, height: hostPicSize)
            .cornerRadius(14)
    }
}

#if DEBUG
// MARK: - Preview
struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(feedRoom: FeedRoom.dummyData[0])
    }
}
#endif
