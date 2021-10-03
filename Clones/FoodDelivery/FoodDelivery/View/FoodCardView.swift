//
//  FoodCardView.swift
//  FoodDelivery
//
//  Created by Rogério Toledo on 10/01/21.
//

import SwiftUI

struct FoodCardView: View {
    // MARK: - PROPERTIES
    var food: Food
    
    // MARK: - BODY
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10, content: {
                
                Text(food.title)
                    .fontWeight(.bold)
                
                Text(food.description)
                    .font(.caption)
                    .lineLimit(3)
                
                Text(food.price)
                    .fontWeight(.bold)
            })
            
            Spacer(minLength: 10)
            
            Image(food.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}
