//
//  HomeView.swift
//  NewsApp
//
//  Created by Rogério Toledo on 04/06/21.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @StateObject private var viewModel = NewsViewModel(service: NewsService())
    @Environment(\.openURL) var openURL
    
    // MARK: - Views
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error) {
                    viewModel.getArticles()
                }
            case .success(let articles):
                NavigationView {
                    List(articles) { item in
                        ArticleView(article: item)
                            .onTapGesture {
                                load(url: item.url)
                            }
                    }
                    .navigationTitle(Text("News"))
                }
            }
        }
        .onAppear {
            viewModel.getArticles()
        }
    }
    
    // MARK: - Functions
    func load(url: String?) {
        guard let link = url, let url = URL(string: link) else { return }
        openURL(url)
    }
}

#if DEBUG
// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
