//
//  ContentView.swift
//  PlaceholderLoadSwiftUI
//
//  Created by Rogério Toledo on 10/01/21.
//

import SwiftUI

struct ContentView: View {
    @State var isLoading = true

    var body: some View {
        ScrollView {
            PostView(post: placeholderPostData)
            
            Divider()
            
            if isLoading {
                PostView(post: placeholderPostData)
                    .redacted(reason: .placeholder)
            }
        }
    }
}
