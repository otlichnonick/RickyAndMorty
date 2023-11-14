//
//  APIManager.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import Foundation
import Combine

protocol APIManager {
    var baseURL: String { get }
}

extension APIManager {
    func fetch<Output: Codable>(endpoint: Endpoint, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Output, Error> {
          do {
              let request = try endpoint.urlRequest(baseUrl: baseURL)
              return URLSession.shared.dataTaskPublisher(for: request)
                  .tryMap { result -> Output in
                      let httpResponse = result.response as? HTTPURLResponse
                      NetworkLogger.log(response: httpResponse, data: result.data)
                      
                      if httpResponse?.statusCode == 204 {
                          throw NetworkError.noContent
                      }
          
                      return try NetworkError.checkDecodingErrors(decoder: decoder, model: Output.self, with: result.data)
                  }
                  .eraseToAnyPublisher()
          } catch {
              return AnyPublisher(
                  Fail<Output, Error>(error: NetworkError.notValidURL)
              )
          }
      }
    
    func fetch<Input: Codable, Output: Codable>(endpoint: Endpoint, params: Input? = nil, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Output, Error> {
        do {
            let request = try endpoint.urlRequest(baseURL: baseURL, bodyData: params)
            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { result -> Output in
                    let httpResponse = result.response as? HTTPURLResponse
                    NetworkLogger.log(response: httpResponse, data: result.data)
                    
                    if httpResponse?.statusCode == 204 {
                        throw NetworkError.noContent
                    }
                    
                    return try NetworkError.checkDecodingErrors(decoder: decoder, model: Output.self, with: result.data)
                }
                .eraseToAnyPublisher()
        } catch {
            return AnyPublisher(
                Fail<Output, Error>(error: NetworkError.notValidURL)
            )
        }
    }
}
