//
//  ChallengeListViewModel.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import SwiftUI
import Combine

class ChallengeListViewModel: ObservableObject {
    private let userService: UserServiceProtocol
    private let challengeService: ChallengeServiceProtocol
    private var cancellables: [AnyCancellable] = []
    
    @Published private(set) var itemViewModels: [ChallengeItemViewModel] = []
    @Published private(set) var error: IncrementError?
    @Published private(set) var isLoading: Bool = false
    @Published var showingCreateModal: Bool = false
    
    let title: String = "Challenges"
    
    enum Action {
        case retry
        case create
        case timeChange
    }
    
    init(userService: UserServiceProtocol = UserService(), challengeService: ChallengeServiceProtocol = ChallengeService()) {
        self.userService = userService
        self.challengeService = challengeService
        observeChallenges()
    }
    
    func send(action: Action){
        switch action {
        case .retry:
            observeChallenges()
        case .create:
            showingCreateModal = true
        case .timeChange:
            cancellables.removeAll()
            observeChallenges()
        }
    }
    
    private func observeChallenges() {
        isLoading = true
        userService
            .currentUserPublisher()
            .compactMap { $0?.uid }
            .flatMap { [weak self] userID -> AnyPublisher<[Challenge], IncrementError> in
                guard let self  = self else { return Fail(error: .default()).eraseToAnyPublisher()}
                return self.challengeService.observeChallenges(userID: userID)
            }
            .sink{ [weak self] completion in
                guard let self  = self else { return }
                self.isLoading = false
                
               switch completion {
               case let .failure(error):
                    self.error = error
               case .finished:
                    print("finished")
               }
            } receiveValue: { [weak self] challenges in
                guard let self  = self else { return }
                self.isLoading = false
                self.showingCreateModal = false
                self.itemViewModels = challenges.map { challenge in
                    .init(challenge, onDelete: { [weak self] id in
                    self?.deleteChallenge(id)
                    }, onToggleComplete: { [weak self] id, activities in
                        self?.updateChallenge(id: id, activities: activities)
                    })
                }
            }
            .store(in: &cancellables)
    }
    
    private func deleteChallenge(_ challengeID: String){
        challengeService.delete(challengeID: challengeID)
            .sink{ [weak self] completion in
                guard let self  = self else { return }

               switch completion {
               case let .failure(error):
                    self.error = error
               case .finished:
                    break
               }
            } receiveValue: { _ in }
            .store(in: &cancellables)
    }
    
    private func updateChallenge(id: String, activities: [Activity]) {
        challengeService.updateChallenge(id, activities: activities)
            .sink{ [weak self] completion in
                guard let self  = self else { return }

               switch completion {
               case let .failure(error):
                    self.error = error
               case .finished:
                    break
               }
            } receiveValue: { _ in }
            .store(in: &cancellables)

    }
}
