//
//  RoomHeaderView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 06/06/21.
//

import SwiftUI

struct RoomHeaderView: View {
    // MARK: Views
    var body: some View {
        HStack(spacing: 20) {
            Label("All rooms", systemImage: "chevron.down")
                .font(Font.Nunito.bold(size: 18))
            
            Spacer()
            
            DSSettings.Images.document
                .font(Font.Nunito.bold(size: 24))
            
            DSSettings.Images.profile_pic
                .resizable()
                .frame(width: 32, height: 32)
                .cornerRadius(11)
        }
        .foregroundColor(DSSettings.Colors.textBlack)
        frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 15)
    }
}
