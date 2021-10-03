//
//  PersonView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 06/06/21.
//

import SwiftUI

struct PersonView: View {
    // MARK: - Properties
    let person: Person
    
    // MARK: - Views
    var body: some View {
        VStack {
            PersonImageView(imageName: person.img)
            
            HStack(spacing: 0) {
                if person.state.contains(.moderator) {
                    DSSettings.Images.star
                        .font(Font.Nunito.bold(size: 8))
                        .foregroundColor(.white)
                        .padding(2)
                        .background(Color.green)
                        .clipShape(Circle())
                        .padding(.trailing, 5)
                }
                
                Text(person.firstName)
                    .font(Font.Nunito.extraBold(size: 13))
                    .foregroundColor(DSSettings.Colors.textBlack)
                    .lineLimit(1)
            }
        }
        .overlay(MuteView()
                    .offset(x: 40, y: 20)
                    .opacity(person.state.contains(.muted) ? 1 : 0)
        )
        .overlay(NewView()
                    .offset(x: -20, y: 20)
                    .opacity(person.state.contains(.new) ? 1 : 0)
        )
    }
}

#if DEBUG
// MARK: - Preview
struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(person: FeedRoom.dummyData[0].hosts[0])
    }
}
#endif
