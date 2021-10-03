//
//  CommentView.swift
//  PlaceholderLoadSwiftUI
//
//  Created by Rogério Toledo on 10/01/21.
//

import SwiftUI

struct CommentView: View {
    let comment: Comment
        
    var body: some View {
        HStack {
            Text(comment.userName).bold() + Text(" \(comment.comment)")
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
}
