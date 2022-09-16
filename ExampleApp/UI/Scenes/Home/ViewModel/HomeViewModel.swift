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
    
    var matchDate = NSDate()
    let dateFormatter = DateFormatter()
    
    let decoder = JSONDecoder()
    var delegate: HomeViewModelDelegate
    var rawResponse: MatchesResponse?
    
    var dateText: String {
        if (Calendar.current.isDateInToday(matchDate as Date)) {
            return NSLocalizedString("HomeViewController.today", comment: "")
        }
        dateFormatter.dateFormat = "E dd MMM"
        return dateFormatter.string(from: matchDate as Date).capitalized
         
    }
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
                    var homeTeamScore = ""
                    var awayTeamScore = ""
                    if (match.score.fullTime.home != nil || match.score.halfTime.home != nil) {
                        homeTeamScore = String(((match.score.fullTime.home != nil) ? match.score.fullTime.home : match.score.halfTime.home) ?? 0)
                        awayTeamScore = String(((match.score.fullTime.away != nil) ? match.score.fullTime.away : match.score.halfTime.away) ?? 0)
                    }
                    var statusText = ""
                    switch match.status {
                    case .paused:
                        statusText = NSLocalizedString("HomeViewModel.paused", comment: "")
                    case .finished:
                        statusText = NSLocalizedString("HomeViewModel.finished", comment: "")
                    case .timed:
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                        let date = dateFormatter.date(from: match.utcDate)
                        dateFormatter.dateFormat = "HH:mm"
                        statusText = dateFormatter.string(from: date!)
                    case .postponed:
                        statusText = NSLocalizedString("HomeViewModel.postponed", comment: "")
                    case .playing:
                        statusText = (match.score.fullTime.away != nil) ? NSLocalizedString("HomeViewModel.playing.FT", comment: "") : NSLocalizedString("HomeViewModel.playing.ST", comment: "")
                    }
                    
                    let matchInformation: MatchInformation = MatchInformation(homeTeamName:  match.homeTeam.name, homeTeamImage: match.homeTeam.crest, awayTeamName: match.awayTeam.name, awayTeamImage: match.awayTeam.crest, homeTeamScore: homeTeamScore, awayTeamScore: awayTeamScore, status: match.status, statusText: statusText)
            
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
        dateFormatter.locale = Locale(identifier: "es_ES")
    }
    
    func loadData() {
        let headers: HTTPHeaders = ["X-Auth-Token":"72e0226514ec49e6ab6e494fb4b38b85", "Content-Type":"application/json"]
        AF.request("https://api.football-data.org/v4/matches", method: .get, parameters: getDateParameters(), encoding: URLEncoding.default, headers: headers)
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
    
    func addDay(quantity: Int) {
        matchDate = Calendar.current.date(byAdding: .day, value: 1, to: matchDate as Date)! as NSDate
    }
    
    func subtractDay(quantity: Int) {
        matchDate = Calendar.current.date(byAdding: .day, value: -1, to: matchDate as Date)! as NSDate
    }
    
    private func getDateParameters() -> Parameters {
        dateFormatter.dateFormat = "YYYY-MM-dd"
        guard let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: matchDate as Date) else { return [:] }
        return ["dateFrom": dateFormatter.string(from: matchDate as Date), "dateTo":dateFormatter.string(from: nextDate as Date) ]
    }
    
    
}
