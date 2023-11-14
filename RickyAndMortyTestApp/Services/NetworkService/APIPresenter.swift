//
//  APIPresenter.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import Foundation
import Combine

final class APIPresenter {
    private var bag: Set<AnyCancellable> = .init()
        
    func baseRequest<T: Codable>(publisher: AnyPublisher<T, Error>, handler: @escaping (Result<T, Error>) -> Void) {
        publisher
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .mapError { error -> Error in
                handler(.failure(error))
                return error
            }
            .sink { _ in } receiveValue: { response in
                handler(.success(response))
            }
            .store(in: &bag)
    }
}
