//
//  ArticleView.swift
//  NewsApp
//
//  Created by Rogério Toledo on 04/06/21.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    // MARK: - Properties
    let article: Article
    
    // MARK: - Views
    var placeholderImageView: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
    
    var body: some View {
        HStack {
            if let imageUrl = article.image,
               let url = URL(string: imageUrl) {
                URLImage(url) { error, _ in
                    placeholderImageView
                } content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .environment(\.urlImageOptions,
                             URLImageOptions(fetchPolicy: .returnStoreElseLoad(downloadDelay: 0.25),
                                             loadOptions: [ .loadOnAppear, .cancelOnDisappear ]))
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            } else {
                placeholderImageView
            }
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                
                HStack(spacing: 8) {
                    Text(article.source ?? "N/A")
                        .foregroundColor(.gray)
                        .font(.footnote)
                    
                    Text(stringFromDate(article.date))
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            })
        }
    }
    
    // MARK: - Functions
    func stringFromDate(_ date: Date?) -> String {
        guard let date = date else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        formatter.doesRelativeDateFormatting = true
        
        return formatter.string(from: date)
    }
}

#if DEBUG
// MARK: - PREVIEW
struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
#endif
