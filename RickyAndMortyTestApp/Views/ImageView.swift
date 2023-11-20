//
//  ImageView.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 18/11/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageView: View {
    let imageUrl: String
    
    var body: some View {
        WebImage(url: URL(string: imageUrl), options: [SDWebImageOptions.decodeFirstFrameOnly])
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
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Constants.mainBlackColor, lineWidth: 1)
            )
    }
}

