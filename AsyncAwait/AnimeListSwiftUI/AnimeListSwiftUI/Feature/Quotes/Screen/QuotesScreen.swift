//
//  QuotesScreen.swift
//  AnimeListSwiftUI
//
//  Created by Rogério Toledo on 26/09/21.
//

import SwiftUI

struct QuotesScreen: View {
    // MARK: - Variables
    @StateObject private var viewModel = QuotesViewModel(service: QuotesService())
    
    // MARK: - Layout
    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .success:
                List {
                    ForEach(viewModel.quotes, id:\.anime) { item in
                        QuoteView(item: item)
                    }
                }
                .navigationBarTitle("Quotes")
            case .loading:
                LoadingView(title: "Fetching Quotes...")
            default:
                EmptyView()
            }
        }
        .task {
            await viewModel.getRandomQuotes()
        }
        .alert("Error",
               isPresented: $viewModel.hasError,
               presenting: viewModel.state) { detail in
            Button("Retry") {
                Task {
                    await viewModel.getRandomQuotes()
                }
            }
        } message: { detail in
            if case let .failed(error) = detail {
                Text(error.localizedDescription)
            }
        }
    }
}

// MARK: - Preview
struct QuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuotesScreen()
    }
}
