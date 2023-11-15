//
//  Helper.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import Foundation

typealias HTTPHeaders = [String: String]

struct URLBuilder {
    static func buildQuery(path: String, queryParams: [String: String]) -> String {
        var urlComponents = URLComponents()
        urlComponents.path = path
        urlComponents.queryItems = queryParams.map { URLQueryItem(name: $0, value: $1) }
        guard let urlString = urlComponents.url?.absoluteString else { return "" }
        return urlString
    }
}
