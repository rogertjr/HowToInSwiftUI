//
//  PostView.swift
//  PlaceholderLoadSwiftUI
//
//  Created by Rogério Toledo on 10/01/21.
//

import SwiftUI

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack (spacing: 12){
            // MARK: - TOP
            Section {
                HStack {
                    Image(post.profileImg)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 45, height: 45)
                    
                    Text(post.userName)
                        .font(.headline)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            // MARK: - MIDDLE
            Section {
                Image(post.postImg)
                    .resizable()
                    .scaledToFit()
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 400, alignment: .center)
                
                HStack {
                    Image(systemName: "heart")
                        .font(.headline)

                    Text("\(post.likes)")
                        .padding(.trailing, 5)
                    
                    Image(systemName: "captions.bubble")
                        .font(.headline)

                    Text("\(post.numOfComments)")
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            // MARK: - BOTTOM
            Section {
               Text(post.description)
                   .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
               
               CommentView(comment: post.topComment)
               
               Text("more comments")
                   .foregroundColor(.accentColor)
                   .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
    }
}
