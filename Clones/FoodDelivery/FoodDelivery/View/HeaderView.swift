//
//  HeaderView.swift
//  FoodDelivery
//
//  Created by Rogério Toledo on 10/01/21.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var homeData : HomeViewModel
    @Environment(\.colorScheme) var scheme
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            HStack(spacing: 0){
                
                // Back button
                Button(action: {}, label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: getSize(), height: getSize())
                        .foregroundColor(.primary)
                })
                
                Text("Restaurant")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            ZStack{
                VStack(alignment: .leading, spacing: 10, content: {
                    // Food Type
                    Text("Asian . Korean . Japanese")
                        .font(.caption)
                    
                    // Description
                    HStack(spacing: 8){
                        HStack {
                            Image(systemName: "clock")
                                .font(.caption)
                            
                            Text("30-40 Min")
                                .font(.caption)
                        }
                        
                        HStack{
                            Image(systemName: "star.fill")
                                .font(.caption)
                            
                            Text("4.3")
                                .font(.caption)
                        }
                        
                        HStack{
                            Image(systemName: "bicycle")
                                .font(.caption)
                            
                            Text("$6.40 Fee")
                                .font(.caption)
                        }
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                })
                .opacity(homeData.offset > 200 ? 1 - Double((homeData.offset - 200) / 50) : 1)
                
                // Custom ScrollView
                ScrollViewReader {reader in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        HStack(spacing: 0){
                            
                            ForEach(tabsItems){tab in
                                
                                Text(tab.tab)
                                    .font(.caption)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Color.primary.opacity(homeData.selectedtab == tab.tab ? 1 : 0))
                                    .clipShape(Capsule())
                                    .foregroundColor(homeData.selectedtab == tab.tab ? scheme == .dark ? .black : .white : .primary)
                                    .id(tab.tab)
                            }
                            .onChange(of: homeData.selectedtab, perform: { value in
                                // todo: fix scroll
                                withAnimation(.easeInOut){
                                    reader.scrollTo(homeData.selectedtab,anchor: .leading)
                                }
                            })
                        }
                    })
                    .opacity(homeData.offset > 200 ? Double((homeData.offset - 200) / 50) : 0)
                }
            }
            .frame(height: 60)
    
            if homeData.offset > 250{
                Divider()
            }
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(scheme == .dark ? Color.black : Color.white)
    }
    
    // MARK: - FUNCTIONS
    // Get button size and animate
    func getSize()->CGFloat{
        if homeData.offset > 200{
            let progress = (homeData.offset - 200) / 50
            
            if progress <= 1.0{
                return progress * 40
            } else {
                return 40
            }
        } else {
            return 0
        }
    }
}
