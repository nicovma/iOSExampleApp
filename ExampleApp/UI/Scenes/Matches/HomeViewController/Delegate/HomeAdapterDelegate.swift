//
//  HomeAdapterDelegate.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 06/09/2022.
//

import Foundation

protocol HomeAdapterDelegate: AnyObject {
    func showMatchDetail()
    func showLeagueStats(code: String)
}

