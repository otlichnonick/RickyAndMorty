//
//  CharactersFetcher.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import Foundation

struct CharactersFetcher: APIManager {
    var baseURL: String = Constants.baseUrl
    private let presenter: APIPresenter = .init()
        
    func getAllNews(queryParams: [String: String], handler: @escaping (Result<CharactersModel, Error>) -> Void) {
        presenter.baseRequest(publisher: fetch(endpoint: Endpoints.getAllCharacters(queryParams)), handler: handler)
    }
}

extension CharactersFetcher {
    enum Endpoints {
        case getAllCharacters([String: String])
    }
}

extension CharactersFetcher.Endpoints: Endpoint {
    var path: String {
        switch self {
        case .getAllCharacters(let queryParams):
            return URLBuilder.buildQuery(path: "character", queryParams: queryParams)
        }
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
