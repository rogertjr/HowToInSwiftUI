//
//  NewView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 06/06/21.
//

import SwiftUI

struct NewView: View {
    // MARK: - Views
    var body: some View {
        Text("🎉")
            .padding(5)
            .background(Color.white)
            .clipShape(Circle())
            .shadow(color: DSSettings.Colors.cardShadowTint,
                    radius: 1,
                    x: 0,
                    y: 1)
    }
}


#if DEBUG
// MARK: - Preview
struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}
#endif
