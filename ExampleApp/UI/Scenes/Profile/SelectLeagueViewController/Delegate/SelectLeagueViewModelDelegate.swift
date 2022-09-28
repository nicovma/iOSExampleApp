//
//  SelectLeagueViewModelDelegate.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/09/2022.
//

import Foundation

protocol SelectLeagueViewModelDelegate: AnyObject {
    func onSuccess(responseCase: SelectLeagueSuccessResponse)
    func onError(error: String)
}

enum SelectLeagueSuccessResponse {
    case loadData
}
