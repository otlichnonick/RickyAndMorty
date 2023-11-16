//
//  SearchView.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 16/11/23.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("Search", text: $searchText)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(Color("mainBeige"))
                .cornerRadius(8)
            
            Button(action: {
                self.searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Color("mainRed"))
                    .opacity(searchText.isEmpty ? 0 : 1)
                    .padding(.trailing, 8)
            }
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        .background(Color("mainRed"))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant("Some text"))
    }
}
