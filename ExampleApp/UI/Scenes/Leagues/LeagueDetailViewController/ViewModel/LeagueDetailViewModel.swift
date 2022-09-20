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
    
    var leagueCode: String?
    
    let decoder = JSONDecoder()
    var delegate: LeagueDetailViewModelDelegate?
    var rawResponse: LeagueDetailResponse?
    
    var uiItems: [LeagueDetailUIItem]? {
        guard let rawResponse = rawResponse else {
            return nil
        }
        
        var uIItems: [LeagueDetailUIItem] = []
        
        uIItems.append(.resume(LeagueResumeInformation(name: rawResponse.competition.name, nation: rawResponse.area.name)))
        
        var tables: [LeagueTablesPosition] = []
        for stand in rawResponse.standings {
            
            var positions: [LeaguePositionInformation] = []
            for table in stand.table {
                let position: LeaguePositionInformation = LeaguePositionInformation(position: String(table.position), image: table.team.crest, name: table.team.name, points: String(table.points))
                positions.append(position)
            }
            let leagueTablesPosition: LeagueTablesPosition = LeagueTablesPosition(position: positions, name: stand.type)
            tables.append(leagueTablesPosition)
        }
        uIItems.append(.position(LeagueTablesInformation(tables: tables)))
        
        return uIItems
    }
    
    // MARK: - Publics methods
    
//    init(delegate: LeagueDetailViewModelDelegate) {
//        self.delegate = delegate
//    }
    
    func loadData() {
        if let leagueCode = leagueCode, let delegate = delegate {
            let headers: HTTPHeaders = ["X-Auth-Token":"72e0226514ec49e6ab6e494fb4b38b85", "Content-Type":"application/json"]
            let url = "https://api.football-data.org/v4/competitions/" + leagueCode + "/standings"
            AF.request(url, method: .get, parameters: getDateParameters(), encoding: URLEncoding.default, headers: headers)
                    .responseData { response in
                        switch response.result {
                        case .failure(let error):
                            delegate.onError(error: error.localizedDescription)
                        case .success(let data):
                            do {
                                let decoder = JSONDecoder()
                                decoder.keyDecodingStrategy = .convertFromSnakeCase
                                self.rawResponse = try decoder.decode(LeagueDetailResponse.self, from: data)
                                delegate.onSuccess(responseCase: .loadData)
                            } catch {
                                delegate.onError(error: error.localizedDescription)
                            }
                        }
                }
        } else {
           // self.delegate.onError(error: NSLocalizedString("Error.genericDescription", comment: ""))
        }
        
        
    }
    private func getDateParameters() -> Parameters {
        return [:]
    }
}
