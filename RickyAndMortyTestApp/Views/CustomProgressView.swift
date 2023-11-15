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
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .padding()

            Spacer()
        }
    }
}

#Preview {
    CustomProgressView()
}
