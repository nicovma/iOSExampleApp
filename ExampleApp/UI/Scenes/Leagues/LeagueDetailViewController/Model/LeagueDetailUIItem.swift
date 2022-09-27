//
//  LeagueDetailUIItem.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 20/09/2022.
//

import Foundation

struct ErrorResponse: Decodable {
    var message: String
    var errorCode: Int
}

struct ScorersResponse: Decodable {
    var count: Int
    var filters: Filter
    var competition: Competition
    var season: Season
    var scorers: [Scorer]
}

struct Scorer: Decodable {
    var player: Player
    var team: Team
    var goals: Int
    var assists: Int?
    var penalties: Int?
}

struct Player: Decodable {
    var id: Int
    var name: String
    var nationality: String?
    var position: String?
    var shirtNumber: Int?
}

struct LeagueDetailResponse: Decodable {
    var filters: Filter?
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
    case resume(LeaguesInformation)
    case scorer(ScoreInformation)
}

struct ScoreInformation: Decodable {
    var name: String
    var teamName: String
    var teamImage: String
    var goals: String
    var assists: String
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
    let form: String?
    let played: String
    let wins: String
    let draw: String
    let lost: String
    let goalDifference: Int
    let points: String
}

struct LeagueResumeInformation: Decodable {
    var name: String
    var nation: String
}

