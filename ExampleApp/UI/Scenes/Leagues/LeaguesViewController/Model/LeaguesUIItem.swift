//
//  LeaguesUIItem.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 19/09/2022.
//

import Foundation

struct LeaguesResponse: Decodable {
    var filters: Filter
    var count: Int
    var competitions: [LeaguesCompetition]
}

struct LeaguesCompetition: Decodable {
    var id: Int
    var area: Area
    var name: String
    var code: String
    var type: String
    var emblem: String
    var currentSeason: Season
    var numberOfAvailableSeasons: Int
}

enum LeaguesUIItem {
    case data(LeaguesInformation)
}

struct LeaguesInformation: Decodable {
    let name: String
    let image: String
    let year: String
    let matchDay: String
    let nationImage: String?
    let nationName: String
    let code: String
}
