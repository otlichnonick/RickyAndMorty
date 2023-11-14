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
        ZStack {
            ScrollView(.vertical) {
                charactersList
            }
        }
    }
}

extension CharactersScreen {
    var charactersList: some View {
        LazyVStack {
            ForEach(viewModel.charactersData?.results ?? []) { characterModel in
                    createView(for: characterModel)
                    .onAppear {
                        if characterModel.id == viewModel.charactersData?.results.last?.id {
                            viewModel.onBottomList()
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
    }
}

#Preview {
    CharactersScreen()
}
