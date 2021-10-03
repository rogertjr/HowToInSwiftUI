//
//  ErrorView.swift
//  NewsApp
//
//  Created by Rogério Toledo on 04/06/21.
//

import SwiftUI

struct ErrorView: View {

    typealias errorViewActionHandler = () -> Void
    
    // MARK: - Properties
    let error: Error
    let actionHandler: errorViewActionHandler
    
    // MARK: - Init
    internal init(error: Error, actionHandler: @escaping ErrorView.errorViewActionHandler) {
        self.error = error
        self.actionHandler = actionHandler
    }
    
    // MARK: - Views
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            
            Text("Ooops")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
            
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
            
            Button(action: {
                actionHandler()
            }, label: {
                Text("Retry")
            })
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size: 15, weight: .heavy))
            .cornerRadius(10)
        }
    }
}

#if DEBUG
// MARK: - PREVIEW
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: ApiError.decodingError) {}
            .previewLayout(.sizeThatFits)
    }
}
#endif

