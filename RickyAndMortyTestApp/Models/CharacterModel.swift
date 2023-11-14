//
//  CharacterModel.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 14/11/23.
//

import Foundation

struct CharactersModel: Codable {
    let info: CharactersInfoModel
    let results: [CharacterModel]
}

struct CharactersInfoModel:Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct CharacterModel: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String //"https://rickandmortyapi.com/api/character/avatar/1.jpeg",
    let url: String //"https://rickandmortyapi.com/api/character/1",
    let created: String //"2017-11-04T18:48:46.250Z"
}
