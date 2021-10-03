//
//  OthersView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 06/06/21.
//

import SwiftUI

struct OthersView: View {
    // MARK: - Properties
    let title: String
    let people: [Person]
    
    private let otherColumn = [
        GridItem(.fixed(65), spacing: 24),
        GridItem(.fixed(65), spacing: 24),
        GridItem(.fixed(65), spacing: 24),
        GridItem(.fixed(65), spacing: 24)
    ]
    
    // MARK: - Views
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(Font.Nunito.bold(size: 14))
                .foregroundColor(DSSettings.Colors.customLightGray)
            
            LazyVGrid(columns: otherColumn,
                      alignment: .leading,
                      spacing: 10) {
                
                ForEach(people) { person in
                    OtherPersonView(person: person)
                }
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 25)
    }
}

#if DEBUG
// MARK: - Preview
struct OthersView_Previews: PreviewProvider {
    static var previews: some View {
        OthersView(title: "Oher people", people: FeedRoom.dummyData[0].othersInRoom)
    }
}
#endif
