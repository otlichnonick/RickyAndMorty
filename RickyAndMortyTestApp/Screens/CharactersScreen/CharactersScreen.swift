//
//  CharactersScreen.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import SwiftUI

struct CharactersScreen: View {
    @StateObject var viewModel = CharactersViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    SearchView(searchText: $viewModel.searchedText)
                        .padding(.horizontal)
                    
                    ScrollView(.vertical) {
                        charactersList
                    }
                }
                
                if viewModel.loadState == .loading {
                    CustomProgressView()
                }
            }
            .background(Constants.mainOrangeColor)
            .onAppear {
                viewModel.getAllCharacters()
            }
        }
    }
}

extension CharactersScreen {
    var charactersList: some View {
        LazyVStack {
            ForEach(viewModel.filteredCharacters) { character in
                NavigationLink {
                    CharacterDetailScreen(selectedCharacter: character)
                } label: {
                    createView(for: character)
                        .onAppear {
                            if character.id == viewModel.characters.last?.id {
                                viewModel.getAllCharacters()
                            }
                        }
                }
            }
        }
    }
}

extension CharactersScreen {
    @ViewBuilder
    private func createView(for character: CharacterModel) -> some View {
        VStack {
            HStack {
                Text(character.name)
                Spacer()
                Text(character.status)
            }
            HStack {
                
            }
        }
        .padding()
        .background(Constants.mainBeigeColor)
        .cornerRadius(Constants.cornerRadius)
        .padding(.horizontal)
    }
}

extension CharactersScreen {
    func showSearchBar() {
        withAnimation {
            viewModel.searchFieldOpacity = 1
        }
    }
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen()
    }
}
