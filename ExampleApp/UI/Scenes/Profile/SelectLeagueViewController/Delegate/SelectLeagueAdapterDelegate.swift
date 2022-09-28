//
//  SelectLeagueAdapterDelegate.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/09/2022.
//

import Foundation

protocol SelectLeagueAdapterDelegate: AnyObject {
    func showLeagueDetail(leaguesInformation: LeaguesInformation)
}
