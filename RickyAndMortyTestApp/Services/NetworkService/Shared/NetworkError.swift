//
//  NetworkError.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case notValidURL
    case notValidBody
    case noContent
    case badResponse
    
    var errorDescription: String? {
        switch self {
        case .notValidURL:
            return "There is incorrect URL"
        case .notValidBody:
            return  "There is not valid body"
        case .noContent:
            return "There is no content"
        case .badResponse:
            return "There is no success with server response"
        }
    }
    
    static func checkDecodingErrors<Output: Codable>(decoder: JSONDecoder, model: Output.Type, with data: Data) throws -> Output {
        do {
            return try decoder.decode(model.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            debugPrint("\(Output.self) could not find key \(key) in JSON: \(context.debugDescription)")
            throw DecodingError.keyNotFound(key, context)
        } catch DecodingError.valueNotFound(let type, let context) {
            debugPrint("\(Output.self) could not find type \(type) in JSON: \(context.debugDescription)")
            throw DecodingError.valueNotFound(type, context)
        } catch DecodingError.typeMismatch(let type, let context) {
            debugPrint("\(Output.self)  type mismatch for type \(type) in JSON: \(context.debugDescription)")
            throw DecodingError.typeMismatch(type, context)
        } catch DecodingError.dataCorrupted(let context) {
            debugPrint("\(Output.self) data found to be corrupted in JSON: \(context.debugDescription)")
            throw DecodingError.dataCorrupted(context)
        }
    }
}
