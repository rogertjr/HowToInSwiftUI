//
//  UpcomingRoomsView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 05/06/21.
//

import SwiftUI

struct UpcomingRoomsView: View {
    // MARK: - Properties
    let upcomingRooms: [UpcomingRoom]
    
    // MARK: - Views
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(upcomingRooms) { room in
                GroupRoomView(upcomingRoom: room)
            }
        }
        .padding(.vertical, 15)
        .padding(.leading, 35)
        .padding(.trailing, 15)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(DSSettings.Colors.customSecondaryBackground)
        .cornerRadius(18)
        .padding(.horizontal, 15)
    }
}

// MARK: - GroupRoomView
struct GroupRoomView: View {
    // MARK: - Properties
    let upcomingRoom: UpcomingRoom
    
    // MARK: - Views
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text(upcomingRoom.date, style: .time)
                .font(Font.Nunito.semiBold(size: 10))
                .foregroundColor(DSSettings.Colors.textYellow)
            
            VStack(alignment: .leading) {
                if let groupName = upcomingRoom.groupName {
                    CurrentGroupView(groupName: groupName)
                }
                Text(upcomingRoom.roomName)
                    .lineLimit(1)
                    .font(Font.Nunito.bold(size: 14))
                    .foregroundColor(DSSettings.Colors.textBlack)
            }
        }
    }
}

// MARK: - CurrentGroupView
struct CurrentGroupView: View {
    // MARK: - Properties
    let groupName: String
    
    // MARK: - Views
    var body: some View {
        HStack {
            Text(groupName)
                .font(Font.Nunito.bold(size: 8))
                .foregroundColor(DSSettings.Colors.textBlack)
            
            DSSettings.Images.home
                .font(Font.Nunito.bold(size: 10))
                .foregroundColor(.green)
        }
    }
}

#if DEBUG
// MARK: - Preview
struct UpcomingRoomsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UpcomingRoomsView(upcomingRooms: UpcomingRoom.dummyData)
                .previewLayout(.sizeThatFits)
            GroupRoomView(upcomingRoom: UpcomingRoom.dummyData[0])
                .previewLayout(.sizeThatFits)
        }
    }
}
#endif
