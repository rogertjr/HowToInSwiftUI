//
//  ContentView.swift
//  LoadingImagesSwiftUI
//
//  Created by Rogério Toledo on 08/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(posters, id: \.self) { url in
            AsyncImageView(
               url: url,
               placeholder: { Text("Loading ...") },
               image: { Image(uiImage: $0).resizable() }
            )
           .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
