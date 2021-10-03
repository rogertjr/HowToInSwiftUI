//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Rogério Toledo on 04/06/21.
//

import Foundation
import Combine

protocol NewsViewModelType {
    func getArticles()
}

class NewsViewModel: ObservableObject, NewsViewModelType {
    
    // MARK: - Properties
    private let service: NewsService
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    @Published private(set) var state: ResultState = .loading
    
    // MARK: - Init
    init(service: NewsService) {
        self.service = service
    }
    
    // MARK: - Requests
    func getArticles() {
        state = .loading
        let cancellable = service
            .request(from: .getNews)
            .sink { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .finished:
                    self.state = .success(content: self.articles)
                    break
                case .failure(let error):
                    self.state = .failed(error: error)
                    break
                }
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.articles = response.articles
            }
            
        cancellables.insert(cancellable)
    }
}
