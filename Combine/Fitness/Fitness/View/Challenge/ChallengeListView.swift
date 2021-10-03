//
//  ChallengeListView.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import SwiftUI

struct ChallengeListView: View {
    @StateObject private var vm = ChallengeListViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                ProgressView()
            } else if let error = vm.error {
                VStack {
                    Text(error.localizedDescription)
                    Button(action: { vm.send(action: .retry) } ) {
                        Text("Retry")
                    }
                    .padding(10)
                    .background(Rectangle().fill(Color.red).cornerRadius(5))
                }
            } else {
                mainContentView
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.significantTimeChangeNotification)) { _ in
                        vm.send(action: .timeChange)
                    }
            }
        }
    }
    
    var mainContentView: some View {
        ScrollView{
            VStack {
                LazyVGrid(columns: [.init(.flexible(), spacing: 20),.init(.flexible())], spacing: 20) {
                    ForEach(vm.itemViewModels, id: \.id) { viewModel in
                        ChallengeItemView(viewModel: viewModel)
                    }
                }
                Spacer()
            }
            .padding(10)
        }
        .sheet(isPresented: $vm.showingCreateModal) {
            NavigationView {
                CreateView()
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        .navigationBarItems(trailing: Button(action: { vm.send(action: .create) }, label: {
            Image(systemName: "plus.circle").imageScale(.large)
        }))
        .navigationTitle(vm.title)
    }
    
}
