//
//  QuerySnapshotPublisher.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import Combine
import Firebase

extension Publishers {
    struct QuerySnapshotPublisher: Publisher {
        typealias Output = QuerySnapshot
        typealias Failure = IncrementError
        
        private let query: Query
        
        init(query: Query){
            self.query = query
        }
        
        func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
            let querySnapshotSubscription = QuerySnapshotSubscription(subscriber: subscriber, query: query)
            subscriber.receive(subscription: querySnapshotSubscription)
        }
    }
    
    class QuerySnapshotSubscription<S: Subscriber>: Subscription where S.Input == QuerySnapshot, S.Failure == IncrementError {
        private var subscriber: S?
        private var listener: ListenerRegistration?
        
        init(subscriber:S, query: Query){
            listener = query.addSnapshotListener { querySnapshot, error in
                if let error = error{
                    subscriber.receive(completion: .failure(.default(description: error.localizedDescription)))
                } else if let querySnapshot = querySnapshot  {
                    _ = subscriber.receive(querySnapshot)
                } else {
                    subscriber.receive(completion: .failure(.default()))
                }
            }
        }
        
        func request(_ demand: Subscribers.Demand) { }
        
        func cancel() {
            self.listener = nil
            self.subscriber = nil
        }
        
        
    }
}
