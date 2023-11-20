//
//  CharacterCellView.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 18/11/23.
//

import SwiftUI

struct CharacterCellView: View {
    let character: CharacterModel
    var status: String {
        character.status == "unknown" ? "My status is unknown" : "I am \(character.status.lowercased())"
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            ImageView(imageUrl: character.image)
                .frame(width: Constants.imageForCellWidth)
            
            VStack(alignment: .leading) {
                Text("My name is: \(character.name)")
                    .multilineTextAlignment(.leading)
                
                Text("My species is: \(character.species)")
                    .multilineTextAlignment(.leading)
                
                Text(status)
            }
            .foregroundColor(Constants.mainBlackColor)
            
            Spacer()
        }
        .padding(8)
        .background(Constants.mainBeigeColor)
        .cornerRadius(Constants.cornerRadius)
        .padding(.horizontal)
    }
}

