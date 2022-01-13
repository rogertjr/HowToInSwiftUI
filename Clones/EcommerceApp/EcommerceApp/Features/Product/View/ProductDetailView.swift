//
//  ProductDetailView.swift
//  EcommerceApp
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - Properties
    var product: Product
    var animation: Namespace.ID
    
    @EnvironmentObject var sharedData: MainViewModel
    @EnvironmentObject var homeData: HomeViewModel
    
    // MARK: - Layout
    var backButton: some View {
        Button {
            withAnimation(.easeInOut) {
                sharedData.showDetailProduct = false
            }
        } label: {
            Image(systemName: "arrow.left")
                .font(.title2)
                .foregroundColor(Color.black.opacity(0.7))
        }
    }
    
    var favouriteButton: some View {
        Button {
            addToLiked()
        } label: {
            Image("Liked")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 22, height: 22)
                .foregroundColor(isLiked() ? .red : Color.black.opacity(0.7))
        }
    }
    
    var titleBarView: some View {
        HStack {
            backButton
            Spacer()
            favouriteButton
        }
        .padding()
    }
    
    var showFullDescriptionButton: some View {
        Button {
        } label: {
            Label {
                Image(systemName: "arrow.right")
            } icon: {
                Text("Full description")
            }
            .font(.custom(customFont, size: 15).bold())
            .foregroundColor(Color("Purple"))
        }
    }
    
    var totalPriceLabel: some View {
        HStack {
            Text("Total")
                .font(.custom(customFont, size: 17))
            
            Spacer()
            
            Text("\(product.price)")
                .font(.custom(customFont, size: 20).bold())
                .foregroundColor(Color("Purple"))
        }
        .padding(.vertical, 20)
    }
    
    var addToCartButton: some View {
        Button {
            addToCart()
        } label: {
            Text("\(isAddedToCart() ? "added" : "add") to basket")
                .font(.custom(customFont, size: 20).bold())
                .foregroundColor(.white)
                .padding(.vertical,20)
                .frame(maxWidth: .infinity)
                .background(
                    Color("Purple")
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                )
        }
    }
    
    var body: some View {
        VStack {
            VStack {
                titleBarView
                
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "\(product.id)\(sharedData.fromSearchPage ? "SEARCH" : "IMAGE")", in: animation)
                    .padding(.horizontal)
                    .offset(y: -12)
                    .frame(maxHeight: .infinity)
            }
            .frame(height: getRect().height / 2.7)
            .zIndex(1)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15) {
                    Text(product.title)
                        .font(.custom(customFont, size: 20).bold())
                    
                    Text(product.subtitle)
                        .font(.custom(customFont, size: 18))
                        .foregroundColor(.gray)
                    
                    Text("Get Apple TV+ free for a year")
                        .font(.custom(customFont, size: 16).bold())
                        .padding(.top)
                    
                    Text("Available when you purchase any new iPhone, iPad, iPod Touch, Mac or Apple TV, £4.99/month after free trial.")
                        .font(.custom(customFont, size: 15))
                        .foregroundColor(.gray)
                    
                    showFullDescriptionButton
                    totalPriceLabel
                    addToCartButton
                }
                .padding([.horizontal,.bottom], 20)
                .padding(.top, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
            )
            .zIndex(0)
        }
        .background(Color("HomeBG")
                        .ignoresSafeArea())
    }
    
    // MARK: - Functions
    func isLiked() -> Bool {
        return sharedData.likedProducts.contains { product in
            return self.product.id == product.id
        }
    }
    
    func isAddedToCart() -> Bool {
        return sharedData.cartProducts.contains { product in
            return self.product.id == product.id
        }
    }
    
    func addToLiked() {
        if let index = sharedData.likedProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }){
            sharedData.likedProducts.remove(at: index)
        } else {
            sharedData.likedProducts.append(product)
        }
    }
    
    func addToCart() {
        if let index = sharedData.cartProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }){
            sharedData.cartProducts.remove(at: index)
        } else {
            sharedData.cartProducts.append(product)
        }
    }
}
