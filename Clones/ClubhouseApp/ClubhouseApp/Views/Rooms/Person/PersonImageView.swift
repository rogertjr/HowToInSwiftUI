//
//  PersonImageView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 06/06/21.
//

import SwiftUI

struct PersonImageView: View {
    // MARK: - Properties
    let imageName: String?
    
    // MARK: - Views
    var body: some View {
        if let imageName = imageName {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .background(DSSettings.Colors.customLightGray)
                .clipShape(ContainerRelativeShape())
        } else {
            DSSettings.Images.person
                .resizable()
                .aspectRatio(contentMode: .fill)
                .background(DSSettings.Colors.customLightGray)
                .clipShape(ContainerRelativeShape())
        }
    }
}

#if DEBUG
// MARK: - Preview
struct PersonImageView_Previews: PreviewProvider {
    static var previews: some View {
        PersonImageView(imageName: nil)
            .previewLayout(.sizeThatFits)
    }
}
#endif
