//
//  NetworkConnectionErrorView.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 19/11/23.
//

import SwiftUI

struct NetworkConnectionErrorView: View {
    @State private var opacity = 1.0
    var body: some View {
        HStack {
            Spacer()
            
            Text("No internet connection.")
                .foregroundColor(Constants.mainBlackColor)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .padding()
        .background(Color.red)
        .onAppear {
            hideNoInternetAlertAfterDelay()
        }
        .opacity(opacity)
    }
    
    private func hideNoInternetAlertAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                opacity = 0
            }
        }
    }
}

