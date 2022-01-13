//
//  MainView.swift
//  EcommerceApp
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

struct MainView: View {
    // MARK: - Properties
    @State var currentTab: Tab = .Home
    @StateObject var sharedData: MainViewModel = MainViewModel()
    @Namespace var animation
    
    // MARK: - Init
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    // MARK: - Layout
    var productPages: some View {
        TabView(selection: $currentTab) {
            HomeView(animation: animation)
                .environmentObject(sharedData)
                .tag(Tab.Home)

            FavouritesView()
                .environmentObject(sharedData)
                .tag(Tab.Liked)

            ProfileView()
                .tag(Tab.Profile)

            CartView()
                .environmentObject(sharedData)
                .tag(Tab.Cart)
        }
    }
    
    var customBottomTabBar: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.self) { tab in
                Button {
                    currentTab = tab
                } label: {
                    Image(tab.rawValue)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22)
                        .background(
                            Color("Purple")
                                .opacity(0.1)
                                .cornerRadius(5)
                                .blur(radius: 5)
                                .padding(-7)
                                .opacity(currentTab == tab ? 1 : 0)
                        )
                        .frame(maxWidth: .infinity)
                        .foregroundColor(currentTab == tab ? Color("Purple") : Color.black.opacity(0.3))
                }
            }
        }
        .padding([.horizontal,.top])
        .padding(.bottom, 10)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            productPages
            customBottomTabBar
        }
        .background(Color("HomeBG")
                        .ignoresSafeArea())
        .overlay(
            ZStack {
                if let product = sharedData.detailProduct,sharedData.showDetailProduct {
                    ProductDetailView(product: product, animation: animation)
                        .environmentObject(sharedData)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        )
    }
}

// MARK: - PreviewProvider
struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
