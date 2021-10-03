//
//  AddItemView.swift
//  MyTasks WatchKit Extension
//
//  Created by Rogério Toledo on 14/02/21.
//

import SwiftUI

struct AddItemView: View {
    
    @State var memoText = ""
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentation
    
    var memoItem: Memo?
    
    var body: some View {
        VStack(spacing: 15) {
            TextField("Memories ...", text: $memoText)
            Button(action: { addMemo() }, label: {
                Text("Save")
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.orange)
                    .cornerRadius(15)
            })
            .padding(.horizontal)
            .buttonStyle(PlainButtonStyle())
            .disabled(memoText == "")
        }
        .navigationTitle("\(memoItem == nil ? "Add" : "Update") Memo")
        .onAppear {
            if let memo = memoItem {
                memoText = memo.title ?? ""
            }
        }
    }
    
    func addMemo() {
        let memo = memoItem == nil ? Memo(context: context) : memoItem!
        memo.title = memoText
        memo.dateAdded = Date()
        
        do {
            try context.save()
            presentation.wrappedValue.dismiss()
        } catch  {
            print(error.localizedDescription)
        }
    }
}
