//
//  OtherPersonView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 06/06/21.
//

import SwiftUI

struct OtherPersonView: View {
    // MARK: - Properties
    let person: Person
    
    // MARK: - Views
    var body: some View {
        VStack {
            Group {
                PersonImageView(imageName: person.img)
                
                Text(person.firstName)
                    .foregroundColor(DSSettings.Colors.textBlack)
                    .font(Font.Nunito.extraBold(size: 13))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .cornerRadius(25)
        }
        .overlay(NewView()
                    .offset(x: -20, y: 5)
                    .opacity(person.state.contains(.new) ? 1 : 0)
        )
    }
}

#if DEBUG
// MARK: - Preview
struct OtherPersonView_Previews: PreviewProvider {
    static var previews: some View {
        OtherPersonView(person: FeedRoom.dummyData[0].hosts[0])
    }
}
#endif
