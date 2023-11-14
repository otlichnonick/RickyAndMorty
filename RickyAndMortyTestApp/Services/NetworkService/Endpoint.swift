//
//  Endpoint.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
}

extension Endpoint {
    func urlRequest(baseUrl: String) throws -> URLRequest {
        guard let url = URL(string: baseUrl + path) else {
            throw NetworkError.notValidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = nil
        NetworkLogger.log(request: request)
        return request
    }
    
    func urlRequest<BodyData: Codable>(baseURL: String, bodyData: BodyData) throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.notValidURL
        }
        
        guard let body = try? JSONEncoder().encode(bodyData) else {
            debugPrint("Error: Trying to convert model to JSON data")
            throw NetworkError.notValidBody
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        NetworkLogger.log(request: request)
        return request
    }
}
