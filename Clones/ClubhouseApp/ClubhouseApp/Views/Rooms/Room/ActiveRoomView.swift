//
//  ActiveRoomView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 06/06/21.
//

import SwiftUI

struct ActiveRoomView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: RoomViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // MARK: - Views
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                RoomHeaderView()
                    .padding(.bottom, 30)
                
                ScrollView {
                    HStack(alignment: .top) {
                        Text(viewModel.activeRoom.roomName)
                            .padding(.leading, 25)
                        Spacer()
                        DSSettings.Images.ellipsis
                            .padding(.top, 10)
                            .padding(.trailing, 25)
                    }
                    .padding(.top, 15)
                    .foregroundColor(DSSettings.Colors.textBlack)
                    .font(Font.Nunito.bold(size: 20))
                    
                    HostsView(people: viewModel.activeRoom.hosts)
                        .padding(.horizontal, 15)
                    
                    if !viewModel.activeRoom.followedBySpeaker.isEmpty {
                        OthersView(title: "Followed by the speaker",
                                   people: viewModel.activeRoom.followedBySpeaker)
                    }
                    OthersView(title: "Other in the room",
                               people: viewModel.activeRoom.othersInRoom)
                }
                .padding(.bottom, 110)
                .background(DSSettings.Colors.background)
                .cornerRadius(37)
            }
            .padding(.top, 65)
            
            BottomRoomView { action in
                switch action {
                case .leave:
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DSSettings.Colors.background)
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

#if DEBUG
// MARK: - Preview
struct ActiveRoomView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveRoomView()
            .environmentObject(RoomViewModel())
    }
}
#endif
