//
//  HomeView.swift
//  LineGraph
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Layout
    var body: some View {
        VStack {
            HStack {
                Button {
                } label: {
                    Image(systemName: "slider.vertical.3")
                        .font(.title2)
                }

                Spacer()
                
                Button {
                } label: {
                    Image("Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                }
            }
            .padding()
            .foregroundColor(.black)
            
            VStack(spacing: 10) {
                Text("Total Balance")
                    .fontWeight(.bold)
                
                Text("$ 51 200")
                    .font(.system(size: 38, weight: .bold))
            }
            .padding(.top, 20)
            
            Button {
            } label: {
                HStack(spacing: 5) {
                    Text("Income")
                    
                    Image(systemName: "chevron.down")
                }
                .font(.caption.bold())
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(.white, in: Capsule())
                .foregroundColor(.black)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.03), radius: 5, x: -5, y: -5)
            }
            
            LineGraphView(data: lineGraphMock)
                .frame(height: 220)
                .padding(.top, 25)
            
            Text("Shorcuts")
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    CardView(image: "youtube", title: "YouTube", price: "$ 26", color: Color("Gradient1"))
                    CardView(image: "apple", title: "Apple", price: "$ 2600", color: Color("Gradient2"))
                    CardView(image: "xbox", title: "Xbox", price: "$ 120", color: Color.green)
                }
                .padding()
            }
        }
    }
}

// MARK: - ViewBuilder
extension HomeView {
    @ViewBuilder
    func CardView(
        image: String,
        title: String,
        price: String,
        color: Color
    )-> some View {
        
        VStack(spacing: 15) {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 35, height: 35)
                .padding()
                .background(color,in: Circle())
            
            Text(title)
                .font(.title3.bold())
            
            Text(price)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
        .padding(.vertical)
        .padding(.horizontal,25)
        .background(.white,in: RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.03), radius: 5, x: -5, y: -5)
    }
}

// MARK: - Properties
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
