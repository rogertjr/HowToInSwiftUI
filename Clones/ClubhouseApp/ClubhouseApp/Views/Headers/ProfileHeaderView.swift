//
//  ProfileHeaderView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 06/06/21.
//

import SwiftUI

struct ProfileHeaderView: View {
    // MARK: - Properties
    enum ProfileHeaderActions {
        case back
    }
    
    typealias ProfileHeaderActionHanler = (_ action: ProfileHeaderActions) -> Void
    let handler: ProfileHeaderActionHanler
    
    init(handler: @escaping ProfileHeaderActionHanler) {
        self.handler = handler
    }
    
    // MARK: - Views
    var body: some View {
        HStack(spacing: 28) {
            Button {
                handler(.back)
            } label: {
                DSSettings.Images.back
            }

            Spacer()
            Text("@")
            DSSettings.Images.gear
        }
        .font(Font.Nunito.bold(size: 24))
        .foregroundColor(DSSettings.Colors.textBlack)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 15)
    }
}

#if DEBUG
// MARK: - Preview
struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView {_ in }
            .previewLayout(.sizeThatFits)
    }
}
#endif
