//
//  NetworkMonitor.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 19/11/23.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")

    @Published var isInternetAvailable = true

    init() {
        checkInternetAvailability()
    }
    
    private func checkInternetAvailability() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isInternetAvailable = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }

    deinit {
        monitor.cancel()
    }
}

