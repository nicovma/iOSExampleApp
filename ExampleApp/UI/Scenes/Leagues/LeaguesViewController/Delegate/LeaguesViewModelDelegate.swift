//
//  LeaguesViewModelDelegate.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 19/09/2022.
//

import Foundation

protocol LeaguesViewModelDelegate: AnyObject {
    func onSuccess(responseCase: LeaguesSuccessResponse)
    func onError(error: String)
}

enum LeaguesSuccessResponse {
    case loadData
}
