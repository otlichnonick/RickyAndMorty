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
    @Published var filteredCharacters: [CharacterModel] = []
    @Published var loadState: LoadState = .notRequest
    @Published var canLoadNextPage = true
    @Published var currentPage = 1
    @Published var errorMessage = ""
    @Published var searchedText = ""
    @Published var searchFieldOpacity = 0.0
    
    private let charactersFetcher = CharactersFetcher()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $searchedText
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink { [weak self] searchText in
                guard let self else { return }
                self.filteredCharacters = self.filter(characters: self.characters, with: searchText)
            }
            .store(in: &cancellables)
    }
}

extension CharactersViewModel {
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
                print(success.info)
                self.characters += success.results
                self.currentPage += 1
                self.filteredCharacters += filter(characters: success.results, with: searchedText)
                self.loadState = .success
            case .failure(let failure):
                self.canLoadNextPage = false
                self.loadState = .error
                self.errorMessage = failure.localizedDescription
            }
        }
    }
    
    private func filter(characters: [CharacterModel], with searchText: String) -> [CharacterModel] {
        return searchText.isEmpty ? characters : characters.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
}
