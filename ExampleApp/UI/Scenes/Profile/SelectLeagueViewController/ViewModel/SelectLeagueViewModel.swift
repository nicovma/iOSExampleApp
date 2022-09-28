//
//  SelectLeagueViewModel.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/09/2022.
//

import Foundation
import Alamofire

class SelectLeagueViewModel{
    
    // MARK: - Properties
    
    let decoder = JSONDecoder()
    var delegate: SelectLeagueViewModelDelegate
    
    var internationalLeagues = ["CL","EC","CLI","WC"]
    
    var rawResponse: LeaguesResponse?
    var rawErrorResponse: ErrorResponse?
    
    var uiItems: [LeaguesUIItem]? {
        guard let rawResponse = rawResponse else {
            return nil
        }
        
        if rawResponse.competitions.count == 0 {
            return nil
        }
        
        var uIItems: [LeaguesUIItem] = []
        
        let filteredCompetitions = rawResponse.competitions.filter { !internationalLeagues.contains($0.code) }
        
        for competition in filteredCompetitions {
            let league = LeaguesInformation(name: competition.name, image: competition.emblem, matchDay: String(competition.currentSeason.currentMatchday), nationImage: competition.area.flag, nationName: competition.area.name, code: competition.code)
            uIItems.append(.data(league))
        }
        return uIItems
    }
    
    // MARK: - Publics methods
    
    init(delegate: SelectLeagueViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadData() {
        let headers: HTTPHeaders = ["X-Auth-Token":"72e0226514ec49e6ab6e494fb4b38b85", "Content-Type":"application/json"]
        AF.request("https://api.football-data.org/v4/competitions", method: .get, parameters: getDateParameters(), encoding: URLEncoding.default, headers: headers)
                .responseData { response in
                    switch response.result {
                    case .failure(let error):
                        self.delegate.onError(error: error.localizedDescription)
                    case .success(let data):
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            if response.response?.statusCode == 200 {
                                self.rawResponse = try decoder.decode(LeaguesResponse.self, from: data)
                                self.delegate.onSuccess(responseCase: .loadData)
                            } else {
                                self.rawErrorResponse = try decoder.decode(ErrorResponse.self, from: data)
                                self.delegate.onError(error: self.rawErrorResponse?.message ?? NSLocalizedString("Error.genericDescription", comment: ""))
                            }
                        } catch {
                            self.delegate.onError(error: error.localizedDescription)
                        }
                    }
            }
        
    }
    private func getDateParameters() -> Parameters {
        return [:]
    }
}
