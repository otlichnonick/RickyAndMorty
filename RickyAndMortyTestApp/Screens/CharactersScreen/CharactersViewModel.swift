//
//  CharactersViewModel.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import Foundation
import Combine

final class CharactersViewModel: ObservableObject {
    @Published var charactersInfo: CharactersInfoModel?
    @Published var characters: [CharacterModel] = []
    @Published var loadState: LoadState = .notRequest
    @Published var canLoadNextPage = true
    @Published var currentPage = 1
    @Published var errorMessage = ""
    private let charactersFetcher = CharactersFetcher()
}

extension CharactersViewModel {
    func onBottomList() {
        
    }
    
    func getAllCharacters() {
        guard canLoadNextPage, loadState != .loading else { return }
        loadState = .loading
        charactersFetcher.getAllNews(queryParams: ["page": "\(currentPage)"]) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let success):
                if success.info.next == nil {
                    canLoadNextPage = false
                }
                self.characters += success.results
                self.currentPage += 1
                self.loadState = .success
            case .failure(let failure):
                self.canLoadNextPage = false
                self.loadState = .error
                self.errorMessage = failure.localizedDescription
            }
        }
    }
}
