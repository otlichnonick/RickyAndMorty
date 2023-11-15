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
            
            if viewModel.loadState == .loading {
                CustomProgressView()
            }
        }
        .background(Color("mainOrange"))
        .onAppear {
            viewModel.getAllCharacters()
        }
    }
}

extension CharactersScreen {
    var charactersList: some View {
        LazyVStack {
            ForEach(viewModel.characters) { characterModel in
                    createView(for: characterModel)
                    .onAppear {
                        if characterModel.id == viewModel.characters.last?.id {
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
        .padding()
        .background(Color("mainBeige"))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

#Preview {
    CharactersScreen()
}
