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
    @Published var searchedName = ""
    @Published var searchedStatus = ""
    @Published var showSearchAlert = false
    
    private let charactersFetcher = CharactersFetcher()
    private var cancellables = Set<AnyCancellable>()
}

extension CharactersViewModel {
    func getCharacters() {
        guard canLoadNextPage, loadState != .loading else { return }
        loadState = .loading
        charactersFetcher.getAllNews(queryParams: getQueryParams()) { [weak self] result in
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
                // we can show alert with error message, but in this case I just print it
                debugPrint("Error with fetch characters: \(self.errorMessage)")
            }
        }
    }
    
    func clearCharacters() {
        canLoadNextPage = true
        characters = []
        currentPage = 1
    }
    
    private func getQueryParams() -> [String: String] {
        return ["page": currentPage.description, "status": searchedStatus, "name": searchedName]
    }
}
