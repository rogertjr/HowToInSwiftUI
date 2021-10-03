//
//  HomeView.swift
//  MyTasks WatchKit Extension
//
//  Created by Rogério Toledo on 14/02/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        GeometryReader { reader in
            let rect = reader.frame(in: .global)
            VStack(spacing: 15) {
                HStack(spacing: 25) {
                    NavigationLink(
                        destination: AddItemView(),
                        label: {
                            NavButton(image: "plus", title: "Memo", rect: rect, color: Color.pink)
                        })
                        .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(
                        destination: DeleteMemoView(),
                        label: {
                            NavButton(image: "trash", title: "Delete", rect: rect, color: Color.red)
                        })
                        .buttonStyle(PlainButtonStyle())
                }
                .frame(width: rect.width, alignment: .center)
                
                HStack(spacing: 25) {
                    NavigationLink(
                        destination: ViewMemoView(),
                        label: {
                            NavButton(image: "doc.plaintext", title: "View", rect: rect, color: Color.blue)
                        })
                        .buttonStyle(PlainButtonStyle())
                    
                    NavButton(image: "star", title: "Rating", rect: rect, color: Color.orange)
                }
                .frame(width: rect.width, alignment: .center)
            }
        }
    }
}

struct NavButton: View {
    var image: String
    var title: String
    var rect: CGRect
    var color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: image)
                .font(.title2)
                .frame(width: rect.width / 3, height: rect.width / 3, alignment: .center)
                .background(color)
                .clipShape(Circle())
            
            Text(title)
                .font(.system(size: 10))
                .foregroundColor(.white)
        }
    }
}
