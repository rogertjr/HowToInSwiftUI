//
//  ChallengeService.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol ChallengeServiceProtocol {
    func create(_ challenge: Challenge) -> AnyPublisher<Void, IncrementError>
    func observeChallenges(userID: UserID) -> AnyPublisher<[Challenge], IncrementError>
    func delete(challengeID: String) -> AnyPublisher<Void, IncrementError>
    func updateChallenge(_ challengeID: String, activities: [Activity]) -> AnyPublisher<Void, IncrementError>
}

class ChallengeService: ChallengeServiceProtocol {
    func observeChallenges(userID: UserID) -> AnyPublisher<[Challenge], IncrementError> {
        let query = db.collection("challenges").whereField("userUid", isEqualTo: userID).order(by: "startDate", descending: true)
        return Publishers.QuerySnapshotPublisher(query: query)
            .flatMap { snapshot -> AnyPublisher<[Challenge], IncrementError> in
                do {
                    let challenges = try snapshot.documents.compactMap {
                        try $0.data(as: Challenge.self)
                    }
                    return Just(challenges).setFailureType(to: IncrementError.self).eraseToAnyPublisher()
                } catch {
                    return Fail(error: .default(description: "Parsing Error")).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    private let db = Firestore.firestore()
    
    func create(_ challenge: Challenge) -> AnyPublisher<Void, IncrementError> {
        return Future<Void, IncrementError> { promise in
            do {
                _ = try self.db.collection("challenges").addDocument(from: challenge) { error in
                    if let error = error {
                        promise(.failure(.default(description: error.localizedDescription)))
                    } else {
                        promise(.success(()))
                    }
                }
                return promise(.success(()))
            } catch {
                return promise(.failure(.default()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func delete(challengeID: String) -> AnyPublisher<Void, IncrementError> {
        return Future<Void, IncrementError> { promise in
            self.db.collection("challenges").document(challengeID).delete { error in
                if let error = error {
                    promise(.failure(.default(description: error.localizedDescription)))
                } else {
                    promise(.success(()))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func updateChallenge(_ challengeID: String, activities: [Activity]) -> AnyPublisher<Void, IncrementError> {
        return Future<Void, IncrementError> { promise in
            self.db.collection("challenges").document(challengeID).updateData(
                ["activities": activities.map {
                    return ["date": $0.date, "isComplete": $0.isComplete]
                }]){ error in
                if let error = error {
                    promise(.failure(.default(description: error.localizedDescription)))
                } else {
                    promise(.success(()))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
