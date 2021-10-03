//
//  DeleteMemoView.swift
//  MyTasks WatchKit Extension
//
//  Created by Rogério Toledo on 14/02/21.
//

import SwiftUI
import CoreData

struct DeleteMemoView: View {
    
    @FetchRequest(entity: Memo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Memo.dateAdded, ascending: false)], animation: .easeIn) var results: FetchedResults<Memo>
    
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentation
    
    @State var deleteMemoItem: Memo?
    @State var deleteMemo = false
    
    var body: some View {
        List(results) { memo in
            
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 6, content: {
                    Text(memo.title ?? "")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    
                    Text(memo.dateAdded ?? Date(), style: .date)
                        .font(.system(size: 8))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                })
                
                Spacer(minLength: 4)
                
                
                Button(action: {
                    deleteMemoItem = memo
                    deleteMemo.toggle()
                    
                }, label: {
                    Image(systemName: "trash")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.red)
                        .cornerRadius(8)
                })
                .buttonStyle(PlainButtonStyle())
            }
        }
        .listStyle(CarouselListStyle())
        .padding(.top)
        .overlay(
            Text(results.isEmpty ? "No memo's to delete" : "")
        )
        .navigationTitle("Delete")
        .alert(isPresented: $deleteMemo, content: {
            Alert(title: Text("Confirm"), message: Text("To delete this memo"), primaryButton: .default(Text("Ok"), action: {
                deleteMemo(memo: deleteMemoItem!)
            }), secondaryButton: .destructive(Text("Cancel")))
        })
    }
    
    func deleteMemo(memo: Memo) {
        context.delete(memo)
        
        do {
            try context.save()
        } catch  {
            print(error.localizedDescription)
        }
    }
    
}
