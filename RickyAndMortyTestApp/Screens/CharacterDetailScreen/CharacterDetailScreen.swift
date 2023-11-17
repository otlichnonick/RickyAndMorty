//
//  CharacterDetailScreen.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterDetailScreen: View {
    @StateObject private var viewModel = CharacterDetailViewModel()
    let character: CharacterModel
    
    init(selectedCharacter: CharacterModel) {
        self.character = selectedCharacter
    }
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: character.image), options: [SDWebImageOptions.decodeFirstFrameOnly])
                .cancelOnDisappear(true)
                .resizable()
                .placeholder {
                    Image(systemName: Constants.imagePlaceholder)
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: Constants.transitionDuration))
                .aspectRatio(contentMode: .fit)
            
            Text(character.name)
                .foregroundColor(Constants.mainBlackColor)
        }
        .padding(.horizontal)
    }
}
