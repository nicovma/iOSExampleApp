//
//  LeagueDetailViewModel.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 20/09/2022.
//

import Foundation
import Alamofire

class LeagueDetailViewModel{
    
    // MARK: - Properties
    
    var leagueSeasonDate = NSDate()
    let dateFormatter = DateFormatter()
    
    var leagueCode: String?
    var internationalLeagues = ["CL","EC","CLI","WC"]
    
    let decoder = JSONDecoder()
    var delegate: LeagueDetailViewModelDelegate?
    
    var rawErrorResponse: ErrorResponse?
    var rawResponse: LeagueDetailResponse?
    var scorersRawResponse: ScorersResponse?
    
    var yearText: String {
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: leagueSeasonDate as Date)
    }
    
    var uiItems: [LeagueDetailUIItem]? {
        guard let rawResponse = rawResponse else {
            return nil
        }
        
        var uIItems: [LeagueDetailUIItem] = []
        
        uIItems.append(.resume(LeaguesInformation(name: rawResponse.competition.name, image: rawResponse.competition.emblem, matchDay: String(rawResponse.season.currentMatchday), nationImage: rawResponse.area.flag, nationName: rawResponse.area.name, code: rawResponse.competition.code)))
        
        if let scorersRawResponse = scorersRawResponse, let scorer = scorersRawResponse.scorers.first {
            var shirtNumber: String? = nil
            if let number = scorer.player.shirtNumber {
                shirtNumber = String(number)
            }
            uIItems.append(.scorer(ScoreInformation(name: scorer.player.name, teamName: scorer.team.name, teamImage: scorer.team.crest ?? "", goals: String(scorer.goals), assists: String(scorer.assists ?? 0), shirtNumber: shirtNumber)))
        }
        
        var tables: [LeagueTablesPosition] = []
        let filteredStandings = rawResponse.standings.filter { $0.type == "TOTAL" }
        for stand in filteredStandings {
            
            var positions: [LeaguePositionInformation] = []
            for table in stand.table {
                
                let position: LeaguePositionInformation = LeaguePositionInformation(position: String(table.position), image: table.team.crest ?? "", name: table.team.shortName ?? table.team.name, form: table.form, played: String(table.playedGames), wins: String(table.won), draw: String(table.draw), lost: String(table.lost), goalDifference: table.goalDifference, points: String(table.points))
                positions.append(position)
            }
            var tableName = NSLocalizedString("LeagueDetailViewModel.regularSeason", comment: "")
            if let group = stand.group {
                tableName = NSLocalizedString("LeagueDetailViewModel.group", comment: "") + group.split(separator: "_")[1]
            }
            let leagueTablesPosition: LeagueTablesPosition = LeagueTablesPosition(position: positions, name: tableName)
            tables.append(leagueTablesPosition)
        }
        uIItems.append(.position(LeagueTablesInformation(tables: tables)))
        
        return uIItems
    }
    
    // MARK: - Publics methods
    
    func loadData() {
        if let leagueCode = leagueCode, let delegate = delegate {
            let group = DispatchGroup()
            var requestError: Error?
            group.enter()
            let headers: HTTPHeaders = ["X-Auth-Token":"72e0226514ec49e6ab6e494fb4b38b85", "Content-Type":"application/json"]
            let url = "https://api.football-data.org/v4/competitions/" + leagueCode + "/standings"
            AF.request(url, method: .get, parameters: getDateParameters(), encoding: URLEncoding.default, headers: headers)
                    .responseData { response in
                        switch response.result {
                        case .failure(let error):
                            requestError = error
                            group.leave()
                        case .success(let data):
                            do {
                                let decoder = JSONDecoder()
                                decoder.keyDecodingStrategy = .convertFromSnakeCase
                                if response.response?.statusCode == 200 {
                                    self.rawResponse = try decoder.decode(LeagueDetailResponse.self, from: data)
                                } else {
                                    self.rawErrorResponse = try decoder.decode(ErrorResponse.self, from: data)
                                }
                                group.leave()
                            } catch {
                                requestError = error
                                group.leave()
                            }
                        }
            }
            
            group.enter()
            let scorersUrl = "https://api.football-data.org/v4/competitions/" + leagueCode + "/scorers"
            AF.request(scorersUrl, method: .get, parameters: getDateParameters(), encoding: URLEncoding.default, headers: headers)
                    .responseData { response in
                        switch response.result {
                        case .failure(let error):
                            requestError = error
                            group.leave()
                        case .success(let data):
                            do {
                                let decoder = JSONDecoder()
                                decoder.keyDecodingStrategy = .convertFromSnakeCase
                                if response.response?.statusCode == 200 {
                                    self.scorersRawResponse = try decoder.decode(ScorersResponse.self, from: data)
                                } else {
                                    self.rawErrorResponse = try decoder.decode(ErrorResponse.self, from: data)
                                }
                                group.leave()
                            } catch {
                                requestError = error
                                group.leave()
                            }
                        }
            }
            
            group.notify(queue: .main) {
                if let errorResponseMessage = self.rawErrorResponse?.message {
                    delegate.onError(error: errorResponseMessage)
                } else {
                    if let requestError = requestError {
                        delegate.onError(error: requestError.localizedDescription)
                    } else {
                        delegate.onSuccess(responseCase: .loadData)
                    }

                }
            }
        }
    }
    
    func substractYear() {
        leagueSeasonDate = Calendar.current.date(byAdding: .year, value: -1, to: leagueSeasonDate as Date)! as NSDate
    }
    
    func addYear() {
        leagueSeasonDate = Calendar.current.date(byAdding: .year, value: 1, to: leagueSeasonDate as Date)! as NSDate
    }
    
    private func getDateParameters() -> Parameters {
        if !isInternationalLeague() {
            dateFormatter.dateFormat = "YYYY"
            let params: Parameters = ["season": dateFormatter.string(from: leagueSeasonDate as Date) ]
            return params
        } else {
            return [:]
        }
    }
    
    func isInternationalLeague() -> Bool {
        guard let leagueCode = leagueCode else {
            return false
        }
        return internationalLeagues.contains(leagueCode)
    }
}
