//
//  MatchDetailViewModelDelegate.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 16/09/2022.
//

import Foundation

protocol MatchDetailViewModelDelegate: AnyObject {
    func onSuccess(responseCase: MatchDetailSuccessResponse)
    func onError(error: String)
}

enum MatchDetailSuccessResponse {
    case loadData
}
