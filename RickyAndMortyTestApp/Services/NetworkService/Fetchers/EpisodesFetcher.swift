//
//  EpisodesFetcher.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 18/11/23.
//

import Foundation

struct EpisodesFetcher: APIManager {
    var baseURL: String = Constants.baseUrl
    private var presenter = APIPresenter()
    
    func getMultipleEpisodes(_ episodes: [Int], handler: @escaping (Result<EpisodesModel, Error>) -> Void) {
        presenter.baseRequest(publisher: fetch(endpoint: Endpoints.getMultipleEpisodes(episodes)), handler: handler)
    }
}

extension EpisodesFetcher {
    enum Endpoints {
        case getMultipleEpisodes([Int])
    }
}

extension EpisodesFetcher.Endpoints: Endpoint {
    var path: String {
        switch self {
        case .getMultipleEpisodes(let array):
            return "episode/\(array)"
        }
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
