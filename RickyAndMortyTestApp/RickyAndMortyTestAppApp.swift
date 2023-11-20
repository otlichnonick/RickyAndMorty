//
//  RickyAndMortyTestAppApp.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import SwiftUI

@main
struct RickyAndMortyTestAppApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
        }
    }
}
