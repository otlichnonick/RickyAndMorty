//
//  CustomProgressView.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 15/11/23.
//

import SwiftUI

struct CustomProgressView: View {
    var body: some View {
        VStack {
            Spacer()

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Constants.mainRedColor))

            Spacer()
        }
    }
}

struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView()
    }
}
