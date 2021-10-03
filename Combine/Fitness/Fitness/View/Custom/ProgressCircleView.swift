//
//  ProgressCircleView.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import SwiftUI

struct ProgressCircleView: View {
    @State private var percentage: CGFloat = 0
    let viewModel: ProgressCircleViewModel
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(style: .init(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .fill(Color.circleOutline)
            
            Circle()
                .trim(from: 0, to: percentage)
                .stroke(style: .init(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .fill(Color.circleTrack)
                .rotationEffect(.init(degrees: -90))
            
            VStack{
                if viewModel.shouldShowTitle {
                    Text(viewModel.title)
                }
                Text(viewModel.message)
            }
            .padding(25)
            .font(Font.caption.weight(.semibold))
        }
        .onAppear() {
            withAnimation(.spring(response: 4)) {
                percentage = CGFloat(viewModel.percentageComplete)
            }
        }
    }
}
