//
//  BottomRoomView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 06/06/21.
//

import SwiftUI

struct BottomRoomView: View {
    // MARK: - Properties
    enum BottomRoomActions {
        case leave
    }
    
    typealias BottomRoomActionHanler = (_ action: BottomRoomActions) -> Void
    let handler: BottomRoomActionHanler
    
    init(handler: @escaping BottomRoomActionHanler) {
        self.handler = handler
    }
    
    // MARK: - Views
    var body: some View {
        HStack(spacing: 22) {
            Button {
                handler(.leave)
            } label: {
                Text("✌🏾 Leave quietly")
                    .font(Font.Nunito.bold(size: 16))
                    .foregroundColor(DSSettings.Colors.customRed)
                    .padding(.horizontal, 13)
                    .padding(.vertical, 8)
                    .background(DSSettings.Colors.customLightGray)
                    .cornerRadius(18)
            }

            Spacer()
            
            DSSettings.Images.plus
                .font(Font.Nunito.semiBold(size: 24))
                .padding(8)
                .background(DSSettings.Colors.customLightGray)
                .clipShape(Circle())
            
            DSSettings.Images.handRaised
                .font(Font.Nunito.semiBold(size: 24))
                .padding(4)
                .background(DSSettings.Colors.customLightGray)
                .clipShape(Circle())
        }
        .padding(.horizontal, 15)
        .padding(.top, 10)
        .frame(maxWidth: .infinity,
               maxHeight: 100,
               alignment: .top)
        .background(DSSettings.Colors.cardBackground)
    }
}

#if DEBUG
// MARK: - Preview
struct BottomRoomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomRoomView {_ in }
    }
}
#endif
