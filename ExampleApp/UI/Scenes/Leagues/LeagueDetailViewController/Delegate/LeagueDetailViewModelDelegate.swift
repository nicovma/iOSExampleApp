//
//  LeagueDetailViewModelDelegate.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 20/09/2022.
//

import Foundation

protocol LeagueDetailViewModelDelegate: AnyObject {
    func onSuccess(responseCase: LeagueDetailSuccessResponse)
    func onError(error: String)
}

enum LeagueDetailSuccessResponse {
    case loadData
}
