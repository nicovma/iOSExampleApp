//
//  LeagueDetailUIItem.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 20/09/2022.
//

import Foundation

struct LeagueDetailResponse: Decodable {
    var filters: Filter
    var area: Area
    var competition: Competition
    var season: Season
    var standings: [Stand]
}

struct Stand: Decodable {
    var stage: String
    var type: String
    var group: String?
    var table: [LeaguePosition]
}

struct LeaguePosition: Decodable {
    var position: Int
    var team: Team
    var playedGames: Int
    var form: String?
    var won: Int
    var draw: Int
    var lost: Int
    var points: Int
    var goalsFor: Int
    var goalsAgainst: Int
    var goalDifference: Int
}

enum LeagueDetailUIItem {
    case position(LeagueTablesInformation)
    case resume(LeagueResumeInformation)
    case scorer(LeagueScoreInformation)
}

struct LeagueScoreInformation: Decodable {
    var name: String
    var teamName: String
    var goals: String
    var shirtNumber: String?
}

struct LeagueTablesInformation: Decodable {
    var tables: [LeagueTablesPosition]
}

struct LeagueTablesPosition: Decodable {
    var position: [LeaguePositionInformation]
    var name: String
}

struct LeaguePositionInformation: Decodable {
    let position: String
    let image: String
    let name: String
    let points: String
}

struct LeagueResumeInformation: Decodable {
    var name: String
    var nation: String
}

