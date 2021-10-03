//
//  BottomHomeView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 05/06/21.
//

import SwiftUI

struct BottomHomeView: View {
    // MARK: - Properties
    
    // MARK: - Views
    var body: some View {
        ZStack {
            DSSettings.Images.grid
                .font(Font.Nunito.bold(size: 24))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 15)
            
            Button(action: {}, label: {
                Label("Start a room", systemImage: "plus")
            })
            .padding(.horizontal, 16)
            .padding(.vertical, 9)
            .font(Font.Nunito.bold(size: 18))
            .foregroundColor(.white)
            .background(DSSettings.Colors.customGreen)
            .cornerRadius(21, antialiased: true)
        }
        .frame(maxWidth: .infinity, maxHeight:  105, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [DSSettings.Colors.background.opacity(0.1),
                                                               DSSettings.Colors.background]),
                                   startPoint: .top,
                                   endPoint: .bottom))
    }
}

#if DEBUG
// MARK: - Preview
struct BottomHomeView_Previews: PreviewProvider {
    static var previews: some View {
        BottomHomeView()
    }
}
#endif
