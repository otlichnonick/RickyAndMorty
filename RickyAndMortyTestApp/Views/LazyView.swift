//
//  LazyView.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 19/11/23.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content

    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: Content {
        build()
    }
}
