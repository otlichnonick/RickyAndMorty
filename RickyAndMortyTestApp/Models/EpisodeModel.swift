//
//  EpisodeModel.swift
//  RickyAndMortyTestApp
//
//  Created by Anton Agafonov on 18/11/23.
//

import Foundation

typealias EpisodesModel = [EpisodeModel]

struct EpisodeModel: Codable, Identifiable {
    let id: Int
    let name, airDate, episode: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode
    }
}
