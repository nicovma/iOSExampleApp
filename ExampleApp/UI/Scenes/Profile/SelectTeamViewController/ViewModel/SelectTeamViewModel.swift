//
//  SelectTeamViewModel.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/09/2022.
//

import Foundation
import Alamofire

class SelectTeamViewModel{
    
    // MARK: - Properties
    let dateFormatter = DateFormatter()
    
    var leagueCode: String?
    
    let decoder = JSONDecoder()
    var delegate: SelectTeamViewModelDelegate?
    
    var rawErrorResponse: ErrorResponse?
    var rawResponse: LeagueDetailResponse?
    
    var uiItems: [SelectTeamUIItem]? {
        guard let rawResponse = rawResponse else {
            return nil
        }
        
        var uIItems: [SelectTeamUIItem] = []
        
        let filteredStandings = rawResponse.standings.filter { $0.type == "TOTAL" }
        for stand in filteredStandings {
            
            
            for table in stand.table {
                let selectTeam: SelectTeam = SelectTeam(name: table.team.name, image: table.team.crest ?? "", code: table.team.id)
                uIItems.append(.team(selectTeam))
            }
        }
        return uIItems
    }
    
    // MARK: - Publics methods
    
    func loadData() {
        if let leagueCode = leagueCode, let delegate = delegate {
            let headers: HTTPHeaders = ["X-Auth-Token":"72e0226514ec49e6ab6e494fb4b38b85", "Content-Type":"application/json"]
            let url = "https://api.football-data.org/v4/competitions/" + leagueCode + "/standings"
            AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
                    .responseData { response in
                        switch response.result {
                        case .failure(let error):
                            delegate.onError(error: error.localizedDescription)
                        case .success(let data):
                            do {
                                let decoder = JSONDecoder()
                                decoder.keyDecodingStrategy = .convertFromSnakeCase
                                if response.response?.statusCode == 200 {
                                    self.rawResponse = try decoder.decode(LeagueDetailResponse.self, from: data)
                                    delegate.onSuccess(responseCase: .loadData)
                                } else {
                                    self.rawErrorResponse = try decoder.decode(ErrorResponse.self, from: data)
                                    delegate.onError(error: self.rawErrorResponse?.message ?? "")
                                }
                            } catch {
                                delegate.onError(error: error.localizedDescription)
                            }
                        }
                    }
        } else {
            delegate?.onError(error: NSLocalizedString("Error.genericDescription", comment: ""))
        }
    }
}
