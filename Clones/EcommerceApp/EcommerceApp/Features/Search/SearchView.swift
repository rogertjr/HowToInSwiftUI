//
//  SearchView.swift
//  EcommerceApp
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

struct SearchView: View {
    // MARK: - Properties
    var animation: Namespace.ID
    
    // Shared Data...
    @EnvironmentObject var sharedData: MainViewModel
    @EnvironmentObject var homeData: HomeViewModel

    @FocusState var startTextField: Bool
    
    // MARK: - Layout
    var backButton: some View {
        Button {
            withAnimation {
                homeData.searchActivated = false
            }
            homeData.searchText = ""
            // Resetting...
            sharedData.fromSearchPage = false
        } label: {
            Image(systemName: "arrow.left")
                .font(.title2)
                .foregroundColor(Color.black.opacity(0.7))
        }
    }
    
    var searchBar: some View {
        HStack(spacing: 15) {
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.gray)
            
            TextField("Search", text: $homeData.searchText)
                .focused($startTextField)
                .textCase(.lowercase)
                .disableAutocorrection(true)
        }
        .padding(.vertical,12)
        .padding(.horizontal)
        .background(
            Capsule()
                .strokeBorder(Color("Purple"), lineWidth: 1.5)
        )
        .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
        .padding(.trailing, 20)
    }
    
    var emptySearchView: some View {
        VStack(spacing: 10) {
            Image("NotFound")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 60)
            
            Text("Item Not Found")
                .font(.custom(customFont, size: 22).bold())
            
            Text("Try a more generic search term or try looking for alternative products.")
                .font(.custom(customFont, size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }
        .padding()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 20) {
                backButton
                searchBar
            }
            .padding([.horizontal])
            .padding(.top)
            .padding(.bottom, 10)
            
            if let products = homeData.searchedProducts {
                if products.isEmpty {
                    emptySearchView
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            Text("Found \(products.count) results")
                                .font(.custom(customFont, size: 24).bold())
                                .padding(.vertical)

                            CustomGrid(columns: 2,spacing: 20, list: products) { product in
                                ProductCardView(product: product)
                            }
                        }
                        .padding()
                    }
                }
            } else {
                ProgressView()
                    .padding(.top,30)
                    .opacity(homeData.searchText == "" ? 0 : 1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color("HomeBG")
                .ignoresSafeArea()
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                startTextField = true
            }
        }
    }
}

// MARK: - ViewBuilder
extension SearchView {
    @ViewBuilder
    func ProductCardView(product: Product) -> some View {
        VStack(spacing: 10) {
            ZStack {
                if sharedData.showDetailProduct {
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0)
                } else {
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(product.id)SEARCH", in: animation)
                }
            }
            .offset(y: -50)
            .padding(.bottom, -50)
            
            Text(product.title)
                .font(.custom(customFont, size: 18))
                .fontWeight(.semibold)
                .padding(.top)
            
            Text(product.subtitle)
                .font(.custom(customFont, size: 14))
                .foregroundColor(.gray)
            
            Text(product.price)
                .font(.custom(customFont, size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color("Purple"))
                .padding(.top, 5)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 22)
        .background(
            Color.white
                .cornerRadius(25)
        )
        .padding(.top,50)
        .onTapGesture {
            withAnimation(.easeInOut) {
                sharedData.fromSearchPage = true
                sharedData.detailProduct = product
                sharedData.showDetailProduct = true
            }
        }
    }
}
