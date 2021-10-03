//
//  ContentView.swift
//  NetworkingSwiftUI
//
//  Created by Rogério Toledo on 08/01/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = PostListViewModel()

    var body: some View {
  
        List {
            ForEach(vm.posts) { post in
                Text(post.title)
                    .foregroundColor(.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
