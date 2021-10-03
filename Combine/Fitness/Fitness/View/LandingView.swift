//
//  LandingView.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import SwiftUI

struct LandingView: View {
    @StateObject private var viewModel = LandingViewModel()
    
    var title: some View {
        Text(viewModel.title)
            .font(.system(size: 64, weight: .medium))
            .foregroundColor(.white)
    }
    
    var createButton: some View {
        Button(action: { viewModel.createPushed = true }, label: {
            HStack(spacing: 15){
                Spacer()
                
                Image(systemName: viewModel.createButtonImage)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(viewModel.createButtonTitle)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                
                Spacer()
            }
        })
        .padding(15)
        .buttonStyle(PrimaryButtonStyle(fillColor: .darkPrimaryButton))
    }
    
    var alreadyButton: some View {
        Button(action: {
            viewModel.loginSignUpPushed = true
        }) {
            Text(viewModel.alreadyButtonTitle)
        }
        .foregroundColor(.white)
    }
    
    var backgroundImage: some View {
        Image(viewModel.backgroundImageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .overlay(Color.black.opacity(0.4))
            
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    Spacer()
                        .frame(height: geo.size.height * 0.08)
                    title
                    Spacer()
                    
                    NavigationLink(destination: CreateView(), isActive: $viewModel.createPushed) {
                        createButton
                    }
                    
                    NavigationLink(destination: LoginSignUpView(viewModel: .init(mode: .login, isPushed: $viewModel.loginSignUpPushed)), isActive: $viewModel.loginSignUpPushed) {
                        alreadyButton
                    }
                }
                .padding(.bottom, 15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    backgroundImage
                        .frame(width: geo.size.width)
                        .edgesIgnoringSafeArea(.all)
                )
            }
        }
        .accentColor(.primary)
    }
}

