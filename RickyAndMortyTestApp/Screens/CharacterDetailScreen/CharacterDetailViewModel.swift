//
//  CharacterDetailViewModel.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import Foundation
import Combine

final class CharacterDetailViewModel: ObservableObject {
    @Published var episodesInfo: EpisodesModel = .init()
    @Published var loadState: LoadState = .notRequest
    @Published var errorMessage = ""
    
    private let episodesFetcher = EpisodesFetcher()
}

extension CharacterDetailViewModel {
    func getInfoFor(characterEpisodes: [String]) {
        loadState = .loading
        let episodes = getEpisodes(from: characterEpisodes)
        episodesFetcher.getMultipleEpisodes(episodes) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let success):
                self.episodesInfo = success
                self.loadState = .success
            case .failure(let failure):
                self.loadState = .error
                self.errorMessage = failure.localizedDescription
                // we can show alert with error message, but in this case I just print it
                debugPrint("Error with fetch episodes: \(self.errorMessage)")
            }
        }
    }
    
    private func getEpisodes(from episodesUrls: [String]) -> [Int] {
         return episodesUrls.compactMap { urlString -> Int? in
             guard let lastComponent = urlString.components(separatedBy: "/").last else { return nil }
             return Int(lastComponent)
        }
    }
}
