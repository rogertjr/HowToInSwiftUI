//
//  QuotesViewModel.swift
//  AnimeListSwiftUI
//
//  Created by Rogério Toledo on 26/09/21.
//

import Foundation

protocol QuotesViewModelType: ObservableObject {
    func getRandomQuotes() async
}

@MainActor
final class QuotesViewModel: QuotesViewModelType {
    
    enum State {
        case na
        case loading
        case success
        case failed(error: Error)
    }
    
    // MARK: - Constants and Variables
    @Published private(set) var quotes: [Quote] = []
    @Published private(set) var state: State = .na
    @Published var hasError: Bool = false
    private let service: QuotesService
    
    // MARK: - Init
    init(service: QuotesService) {
        self.service = service
    }
    
    // MARK: - Api Functions
    func getRandomQuotes() async {
        state = .loading
        hasError = false
        do {
            quotes = try await service.fetchRandomQuotes()
            state = .success
        } catch {
            state = .failed(error: error)
            hasError = true
        }
    }
}
