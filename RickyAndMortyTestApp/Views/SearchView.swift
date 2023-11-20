//
//  SearchView.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 16/11/23.
//

import SwiftUI

struct SearchView: View {
    @Binding var nameSearchText: String
    @Binding var statusSearchText: String
    
    var body: some View {
        VStack(spacing: 24) {
            TextField(Constants.searchWithName, text: $nameSearchText)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(Constants.mainBeigeColor)
                .cornerRadius(8)
            
            TextField(Constants.searchWithStatus, text: $statusSearchText)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(Constants.mainBeigeColor)
                .cornerRadius(8)
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        .background(Constants.mainRedColor)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
