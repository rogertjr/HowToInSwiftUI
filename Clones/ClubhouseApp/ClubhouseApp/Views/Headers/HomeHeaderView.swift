//
//  HomeHeaderView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 05/06/21.
//

import SwiftUI

struct HomeHeaderView: View {
    // MARK: - Properties
    enum HomeHeaderActions {
        case profile
    }
    
    typealias HomeHeaderActionsHandler = (_ action: HomeHeaderActions) -> Void
    let handler: HomeHeaderActionsHandler
    
    // MARK: - Init
    init(handler: @escaping HomeHeaderView.HomeHeaderActionsHandler) {
        self.handler = handler
    }
    
    // MARK: - Views
    var body: some View {
        HStack(spacing: 20) {
            DSSettings.Images.search
            Spacer()
            DSSettings.Images.invite
            DSSettings.Images.calendar
            DSSettings.Images.notificationBell
            
            Button {
                handler(.profile)
            } label: {
                DSSettings.Images.profile_pic
                    .resizable()
                    .frame(width: 32, height: 32)
                    .cornerRadius(11)
            }
        }
        .font(Font.Nunito.bold(size: 24))
        .frame(maxWidth: .infinity, maxHeight: 50)
        .padding(.horizontal, 15)
    }
}

#if DEBUG
// MARK: - Preview
struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView {_ in }
            .previewLayout(.sizeThatFits)
    }
}
#endif
