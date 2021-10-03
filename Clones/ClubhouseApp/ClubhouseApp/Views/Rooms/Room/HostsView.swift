//
//  HostsView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 06/06/21.
//

import SwiftUI

struct HostsView: View {
    // MARK: - Properties
    let people: [Person]
    
    private let otherColumn = [
        GridItem(.fixed(85), spacing: 25),
        GridItem(.fixed(85), spacing: 25),
        GridItem(.fixed(85), spacing: 25)
    ]
    
    // MARK: - Views
    var body: some View {
        LazyVGrid(columns: otherColumn,
                  alignment: .leading,
                  spacing: 10) {
            
            ForEach(people) { person in
                PersonView(person: person)
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 25)
    }
}

#if DEBUG
// MARK: - Preview
struct HostsView_Previews: PreviewProvider {
    static var previews: some View {
        HostsView(people: FeedRoom.dummyData[0].othersInRoom)
    }
}
#endif
