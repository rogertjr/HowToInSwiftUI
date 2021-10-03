//
//  ChallengeViewModel.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import SwiftUI
import Combine

typealias UserID = String

final class ChallengeViewModel: ObservableObject {
    @Published var exerciseDropDown = ChallengePartViewModel(type: .exercise)
    @Published var startAmountDropDown = ChallengePartViewModel(type: .startAmount)
    @Published var increaseDropDown = ChallengePartViewModel(type: .increase)
    @Published var lengthDropDown = ChallengePartViewModel(type: .length)
    
    @Published var error: IncrementError?
    @Published var isLoading: Bool = false
    
    private let userService: UserServiceProtocol
    private let challengeService: ChallengeServiceProtocol
    private var cancellables: [AnyCancellable] = []
    
    enum Action {
        case createChallenge
    }
    
    init(userService: UserServiceProtocol = UserService(), challengeService: ChallengeServiceProtocol = ChallengeService()) {
        self.userService = userService
        self.challengeService = challengeService
    }
    
    func send(action: Action){
        switch action {
        case .createChallenge:
            isLoading = true
            currentUserID()
                .flatMap {userID -> AnyPublisher<Void, IncrementError> in
                    return self.createChallenge(userID: userID)
                }
                .sink { (completion) in
                    self.isLoading = false
                    
                    switch completion {
                    case let .failure(error):
                        self.error = error
                    case .finished:
                        print("finished")
                    }
                } receiveValue: { _ in
                    print("Success")
                }
                .store(in: &cancellables)
        }
    }
    
    private func createChallenge(userID: UserID) -> AnyPublisher<Void, IncrementError> {
        guard let exercise = exerciseDropDown.text,
          let startAmount = startAmountDropDown.number,
                let increase = increaseDropDown.number,
                    let length = lengthDropDown.number else {
            return Fail(error: .default(description: "Parsing error "))
                    .eraseToAnyPublisher()
        }
        
        let startDate = Calendar.current.startOfDay(for: Date())
        
        let challenge = Challenge(exercise: exercise, startAmount: startAmount, increase: increase, length: length, userUid: userID, startDate: startDate, activities: (0..<length).compactMap{ dayNum in
            if let dateForDayNum = Calendar.current.date(byAdding: .day, value: dayNum, to: startDate){ return .init(date: dateForDayNum, isComplete: false) } else { return nil }
        })
        
        return challengeService.create(challenge).eraseToAnyPublisher()
    }
    
    private func currentUserID() -> AnyPublisher<UserID, IncrementError> {
        return userService.currentUserPublisher().flatMap { user -> AnyPublisher<UserID, IncrementError> in
            if let userID = user?.uid {
                return Just(userID)
                    .setFailureType(to: IncrementError.self)
                    .eraseToAnyPublisher()
            } else {
                return self.userService
                    .sigInAnon()
                    .map { $0.uid }
                    .eraseToAnyPublisher()
            }
        }
        .eraseToAnyPublisher()
    }
}

extension ChallengeViewModel {
    struct ChallengePartViewModel: DropdownItemProtocol {
        var selectedOption: DropdownOption
        
        var options: [DropdownOption]
        
        var headerTitle: String {
            type.rawValue
        }
        
        var dropdownTitle: String {
            selectedOption.formatted
        }
        
        var isSelected: Bool = false
        
        private let type: ChallengePartType
        
        init(type: ChallengePartType){
            switch type {
            case .exercise:
                self.options = ExerciseOption.allCases.map { $0.toDropdownOption}
            case .startAmount:
                self.options = StartAmountOption.allCases.map { $0.toDropdownOption}
            case .increase:
                self.options = DailyIncreaseOption.allCases.map { $0.toDropdownOption}
            case .length:
                self.options = LengthOption.allCases.map { $0.toDropdownOption}
            }
            
            self.type = type
            self.selectedOption = options.first!
        }
        
        enum ChallengePartType: String, CaseIterable {
            case exercise = "Exercise"
            case startAmount = "Stating Amount"
            case increase = "Daily Increase"
            case length = "Challenge Length"
        }
        
        enum ExerciseOption: String, CaseIterable, DropdownOptionProtocol {
            case pullups
            case pushups
            case situps
            
            var toDropdownOption: DropdownOption {
                .init(type: .text(rawValue), formatted: rawValue.capitalized)
            }
        }
        
        enum StartAmountOption: Int,CaseIterable, DropdownOptionProtocol {
            case one = 1, two, three, four, five
            
            var toDropdownOption: DropdownOption {
                .init(type: .number(rawValue), formatted: String(rawValue))
            }
        }
        
        enum DailyIncreaseOption: Int, CaseIterable, DropdownOptionProtocol {
            case one = 1, two, three, four, five
            
            var toDropdownOption: DropdownOption {
                .init(type: .number(rawValue), formatted: "+\(rawValue)")
            }
        }
        
        enum LengthOption: Int, CaseIterable, DropdownOptionProtocol {
            case seven = 7, fourteen = 14, twentyOne = 21, twentyEight = 28
            
            var toDropdownOption: DropdownOption {
                .init(type: .number(rawValue), formatted: "\(rawValue) days")
            }
        }
    }
}

extension ChallengeViewModel.ChallengePartViewModel {
    var text: String? {
        if case let .text(text) = selectedOption.type {
            return text
        } else {
            return nil
            
        }
    }
    
    var number: Int? {
        if case let .number(number) = selectedOption.type {
            return number
        } else {
            return nil
        }
    }
    
}
