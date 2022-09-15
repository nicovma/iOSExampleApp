//
//  HomeViewModel.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 06/09/2022.
//

import Foundation
import Alamofire

class HomeViewModel {
    
    // MARK: - Properties
    
    let decoder = JSONDecoder()
    var delegate: HomeViewModelDelegate
    var rawResponse: MatchesResponse?
    
    var uiItems: [HomeUIItem]? {
        guard let rawResponse = rawResponse else {
            return nil
        }
        
        if rawResponse.matches.count == 0 {
            return [.noMatches]
        }
        
        let matchesByLeague = Dictionary(grouping: rawResponse.matches, by: { $0.competition.id })
        var leagues = rawResponse.matches.map({ (match: Match) -> Competition in
            match.competition
        })
        
        leagues = leagues.uniqued()
        
        var UIItems: [HomeUIItem] = []
        
        for league in leagues {
            let leagueInformation: LeagueInformation = LeagueInformation(name: league.name, image: league.emblem, matchDay: nil)
            let matchesInformation: [MatchInformation] = matchesByLeague[league.id].map({ (matches: [Match]) -> [MatchInformation] in
                var matchesByLeagueInformation: [MatchInformation] = []
                for match in matches {
                    let homeTeamScore = String(((match.score.fullTime.home != nil) ? match.score.fullTime.home : match.score.halfTime.home) ?? 0)
                    let awayTeamScore = String(((match.score.fullTime.away != nil) ? match.score.fullTime.away : match.score.halfTime.away) ?? 0)
                    let matchInformation: MatchInformation = MatchInformation(homeTeamName:  match.homeTeam.name, homeTeamImage: match.homeTeam.crest, awayTeamName: match.awayTeam.name, awayTeamImage: match.awayTeam.crest, homeTeamScore: homeTeamScore, awayTeamScore: awayTeamScore, status: match.status)
            
                    matchesByLeagueInformation.append(matchInformation)
                }
                return matchesByLeagueInformation
            })!
            
            let leaguesMatches: LeagueMatches = LeagueMatches(league: leagueInformation, matches: matchesInformation)
            UIItems.append(.data(leaguesMatches))
        }
        
        return UIItems
    }
    
    // MARK: - Publics methods
    
    init(delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadData() {
        let headers: HTTPHeaders = ["X-Auth-Token":"72e0226514ec49e6ab6e494fb4b38b85", "Content-Type":"application/json"]
        AF.request("https://api.football-data.org/v4/matches", method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
                .responseData { response in
                    switch response.result {
                    case .failure(let error):
                        self.delegate.onError(error: error.localizedDescription)
                    case .success(let data):
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            self.rawResponse = try decoder.decode(MatchesResponse.self, from: data)
                            self.delegate.onSuccess(responseCase: .loadData)
                        } catch {
                            self.delegate.onError(error: error.localizedDescription)
                        }
                    }
            }
        
    }
    
    
    
    
}
