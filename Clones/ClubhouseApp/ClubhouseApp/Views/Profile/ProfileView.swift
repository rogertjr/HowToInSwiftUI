//
//  ProfileView.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 06/06/21.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // MARK: - Views
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                ProfileHeaderView { action in
                    switch action {
                    case .back:
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                Group {
                    DSSettings.Images.profile_pic
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(30)
                    
                    Text("Rogério Toledo")
                        .font(Font.Nunito.bold(size: 16))
                    
                    Text("@rogertjr")
                        .font(Font.Nunito.bold(size: 12))
                        .padding(.top, 1)
                    
                    HStack {
                        HStack(spacing: 0) {
                            Text("237")
                                .font(Font.Nunito.extraBold(size: 16))
                                .padding(.trailing, 5)
                            Text("followers")
                                .font(Font.Nunito.semiBold(size: 12))
                                .padding(.trailing, 5)
                        }
                        .padding(.trailing, 30)
                        
                        HStack(spacing: 0) {
                            Text("59")
                                .font(Font.Nunito.extraBold(size: 16))
                                .padding(.trailing, 5)
                            Text("following")
                                .font(Font.Nunito.semiBold(size: 12))
                                .padding(.trailing, 5)
                        }
                        .padding(.trailing, 30)
                    }
                    .padding(.top, 15)
                    
                    Text("iOS Developer | Github\nhttps://github.com/rogertjr")
                        .padding(.top, 10)
                        .font(Font.Nunito.semiBold(size: 14))
                    
                    HStack(alignment: .top) {
                        Image("person_0")
                            .resizable()
                            .frame(width: 38, height: 38)
                            .cornerRadius(15)
                        
                        VStack(alignment: .leading) {
                            Text("Joined 06 Jun 2021")
                                .font(Font.Nunito.regular(size: 12))
                            
                            Text("Nominated by ")
                                .font(Font.Nunito.regular(size: 12)) +
                            Text("Jane Doe")
                                .font(Font.Nunito.bold(size: 12))
                        }
                    }
                }
                .foregroundColor(DSSettings.Colors.textBlack)
                .padding(.horizontal, 15)
                
                Spacer()
            }
            .padding(.top, 65)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DSSettings.Colors.background)
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

#if DEBUG
// MARK: - Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
#endif
