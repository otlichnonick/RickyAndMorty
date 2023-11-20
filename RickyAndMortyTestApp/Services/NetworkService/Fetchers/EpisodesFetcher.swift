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
    
    func getMultipleEpisodes(_ episodes: String, handler: @escaping (Result<EpisodesModel, Error>) -> Void) {
        presenter.baseRequest(publisher: fetch(endpoint: Endpoints.getMultipleEpisodes(episodes)), handler: handler)
    }
}

extension EpisodesFetcher {
    enum Endpoints {
        case getMultipleEpisodes(String)
    }
}

extension EpisodesFetcher.Endpoints: Endpoint {
    var path: String {
        switch self {
        case .getMultipleEpisodes(let episodes):
            return "episode/\(episodes)"
        }
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
