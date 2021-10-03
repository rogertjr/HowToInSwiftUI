//
//  ViewMemoView.swift
//  MyTasks WatchKit Extension
//
//  Created by Rogério Toledo on 14/02/21.
//

import SwiftUI
import CoreData

struct ViewMemoView: View {
    
    @FetchRequest(entity: Memo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Memo.dateAdded, ascending: false)], animation: .easeIn) var results: FetchedResults<Memo>
    
    var body: some View {
        List(results) { memo in
            
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 3, content: {
                    Text(memo.title ?? "")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    
                    Text("Last Modified")
                        .font(.system(size: 8))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                    
                    Text(memo.dateAdded ?? Date(), style: .date)
                        .font(.system(size: 8))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                })
                
                Spacer(minLength: 4)
                
                NavigationLink(
                    destination: AddItemView(memoItem: memo),
                    label: {
                        Image(systemName: "square.and.pencil")
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.orange)
                            .cornerRadius(8)
                    })
                    .buttonStyle(PlainButtonStyle())
            }
        }
        .listStyle(CarouselListStyle())
        .padding(.top)
        .overlay(
            Text(results.isEmpty ? "No memo's found" : "")
        )
        .navigationTitle("Memo's")
    }
}

