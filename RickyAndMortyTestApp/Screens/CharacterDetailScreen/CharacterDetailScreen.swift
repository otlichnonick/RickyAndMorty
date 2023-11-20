//
//  CharacterDetailScreen.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import SwiftUI

struct CharacterDetailScreen: View {
    @StateObject private var viewModel = CharacterDetailViewModel()
    
    let character: CharacterModel
    private var episodesTitle: String {
        switch viewModel.episodesInfo.count {
        case 0:
            return ""
        case 1:
            return "Was seen in the episode:"
        default:
            return "Was seen in the episodes:"
        }
    }
    
    init(selectedCharacter: CharacterModel) {
        self.character = selectedCharacter
    }
    
    var body: some View {
        ZStack {
            VStack {
                ImageView(imageUrl: character.image)
                    .frame(width: Constants.imageForDetailScreenWidth)
                    .padding(.top)
                
                Text((Constants.greetings.randomElement() ?? "") + "\nI am " + character.name)
                    .foregroundColor(Constants.mainBlackColor)
                    .multilineTextAlignment(.center)
                    .font(.system(.title))
                    .padding(.horizontal)
                
                ZStack {
                    List {
                        Section {
                            ForEach(viewModel.episodesInfo) { episode in
                                VStack(alignment: .leading) {
                                    Text(episode.name)
                                    Text(episode.airDate)
                                    Text(episode.episode)
                                }
                                .foregroundStyle(Constants.mainBlackColor)
                                .listRowBackground(Color.white)
                            }
                        } header: {
                            Text(episodesTitle)
                                .font(.system(.title2))
                                .foregroundColor(Constants.mainBlackColor)
                        }
                    }
                    
                    if viewModel.loadState == .loading {
                        CustomProgressView()
                    }
                }
            }
        }
        .background(Constants.mainBeigeColor)
        .onAppear {
            viewModel.getInfoFor(characterEpisodes: character.episode)
        }
    }
}

struct CharacterDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailScreen(selectedCharacter: CharacterModel(
            id: 1,
            name: "Name",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2"]))
    }
}
