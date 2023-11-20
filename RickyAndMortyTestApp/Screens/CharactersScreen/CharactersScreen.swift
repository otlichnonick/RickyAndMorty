//
//  CharactersScreen.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import SwiftUI

struct CharactersScreen: View {
    @StateObject var viewModel = CharactersViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ScrollView(.vertical) {
                        charactersList
                    }
                    
                    Button(action: {
                        viewModel.showSearchAlert = true
                    }, label: {
                        HStack {
                            Spacer()
                            
                            Text(Constants.searchButtonTitle)
                                .foregroundColor(Constants.mainBlackColor)
                                .padding(.vertical)
                            
                            Spacer()
                        }
                            .background(Constants.mainRedColor)
                            .cornerRadius(Constants.cornerRadius)
                    })
                        .padding(.horizontal)
                }
                
                if !networkMonitor.isInternetAvailable {
                    VStack {
                        NetworkConnectionErrorView()
                        Spacer()
                    }
                }
                
                if viewModel.loadState == .loading {
                    CustomProgressView()
                }
            }
            .background(Constants.mainOrangeColor)
            .onAppear {
                if networkMonitor.isInternetAvailable {
                    viewModel.getCharacters()
                }
            }
            .onReceive(networkMonitor.$isInternetAvailable) { isAvailable in
                if isAvailable {
                    viewModel.getCharacters()
                }
            }
            .alert("Enter values for search", isPresented: $viewModel.showSearchAlert, actions: {
                VStack(spacing: 24) {
                    TextField(Constants.searchWithName, text: $viewModel.searchedName)
                    
                    TextField(Constants.searchWithStatus, text: $viewModel.searchedStatus)
                    
                    Button("OK", action: {
                        viewModel.clearCharacters()
                        viewModel.getCharacters()
                        viewModel.showSearchAlert = false
                    })
                    
                    Button("CANCEL") {
                        viewModel.showSearchAlert = false
                    }
                }
            })
        }
    }
}

extension CharactersScreen {
    var charactersList: some View {
        LazyVStack {
            ForEach(viewModel.characters) { character in
                NavigationLink {
                    LazyView(CharacterDetailScreen(selectedCharacter: character))
                } label: {
                    CharacterCellView(character: character)
                        .onAppear {
                            if character.id == viewModel.characters.last?.id {
                                viewModel.getCharacters()
                            }
                        }
                }
            }
        }
    }
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen()
    }
}
