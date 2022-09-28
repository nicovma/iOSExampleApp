//
//  SelectTeamViewModelDelegate.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/09/2022.
//

import Foundation

protocol SelectTeamViewModelDelegate: AnyObject {
    func onSuccess(responseCase: SelectTeamSuccessResponse)
    func onError(error: String)
}

enum SelectTeamSuccessResponse {
    case loadData
}
