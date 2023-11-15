//
//  Enums.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PATCH
    case PUT
    case DELETE
}

enum LoadState {
    case notRequest
    case loading
    case success
    case error
}
