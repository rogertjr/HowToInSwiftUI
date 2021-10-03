//
//  Post.swift
//  PlaceholderLoadSwiftUI
//
//  Created by Rogério Toledo on 10/01/21.
//

import Foundation

struct Post: Identifiable {
    let id: Int
    let userName : String
    let profileImg : String
    let postImg : String
    let likes : Int
    let numOfComments : Int
    let description : String
    let topComment : Comment
}

let placeholderPostData = Post(id: 1, userName: "username",
                                   profileImg: "profile",
                                   postImg: "post", likes: 1234,
                                   numOfComments: 5678,
                                   description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                                   topComment: Comment(id: 1, userName: "username",
                                                           comment: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."))
