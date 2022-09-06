//
//  HomeViewModelDelegate.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 06/09/2022.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func onSuccess(responseCase: HomeSuccessResponse)
    func onError(error: String)
}

enum HomeSuccessResponse {
    case loadData
}
