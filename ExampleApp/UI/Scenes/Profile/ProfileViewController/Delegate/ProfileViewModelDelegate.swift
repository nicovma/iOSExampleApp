//
//  ProfileViewDelegate.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 05/09/2022.
//

import Foundation

protocol ProfileViewModelDelegate: AnyObject {
    func onSuccess(responseCase: ProfileSuccessResponse)
    func onError(error: String)
}

enum ProfileSuccessResponse {
    case logout
    case loadData
}
