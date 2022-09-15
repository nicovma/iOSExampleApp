//
//  HomeUIItem.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 06/09/2022.
//

import Foundation

struct LeagueMatches: Decodable {
  let league: LeagueInformation
  let matches: [MatchInformation]
}

struct LeagueInformation: Decodable {
    let name: String
    let image: String
    let matchDay: String?
}

struct MatchInformation: Decodable {
    let homeTeamName: String
    let homeTeamImage: String
    let awayTeamName: String
    let awayTeamImage: String
    let homeTeamScore: String
    let awayTeamScore: String
    let status: MatchStatus
}

enum HomeUIItem {
    case data(LeagueMatches)
    case noMatches
}

enum NotTaskType: Decodable {
    case createGroup
    case joinToGroup
}

struct MatchesResponse: Decodable {
    var filters: Filter
    var resultSet: ResultSet
    var matches: [Match]
}

struct ResultSet: Decodable {
    var count: Int
    var competitions: String?
    var first: String?
    var last: String?
    var played: Int?
}

struct Filter: Decodable {
    var dateFrom: String?
    var dateTo: String?
    var permission: String?
}

struct Match: Decodable {
    var id: Int
    var area: Area
    var competition: Competition
    var season: Season
    var utcDate: String
    var status : MatchStatus
    var matchday: Int
    var stage: String
    var group: String?
    var homeTeam: Team
    var awayTeam: Team
    var score: MatchScore
    var referees: [MatchReferee]
    
}

struct Area: Decodable {
    var id: Int
    var name: String
    var code: String
    var flag: String
}

struct Competition: Decodable, Hashable {
    var id: Int
    var name: String
    var code: String
    var type: String
    var emblem: String
}

struct Season: Decodable {
    var id: Int
    var startDate: String?
    var endDate: String?
    var nationality: String?
    var currentMatchday: Int
    var winner: Team?
}

enum MatchStatus: String, Decodable {
    case finished = "FINISHED"
    case timed = "TIMED"
    case postponed = "POSTPONED"
    case playing = "IN_PLAY"
    case paused = "PAUSED"
}

struct Team: Decodable {
    var id: Int
    var name: String
    var shortName: String
    var tla: String
    var crest: String
}

struct MatchReferee: Decodable {
    var id: Int
    var name: String
    var nationality: String?
}

struct MatchScore: Decodable {
    var winner: MatchWinner?
    var duration: String
    var fullTime: TimeScore
    var halfTime: TimeScore
}

struct TimeScore: Decodable {
    var home: Int?
    var away: Int?
}

enum MatchWinner: String, Decodable {
    case home = "HOME_TEAM"
    case away = "AWAY_TEAM"
    case draw = "DRAW"
}
