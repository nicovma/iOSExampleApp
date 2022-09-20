//
//  HomeTableViewAdapter.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 06/09/2022.
//

import Foundation
import UIKit

// MARK: - Properties

class HomeTableViewAdapter: NSObject {
    
    // MARK: - Properties
    
    var delegate: HomeAdapterDelegate
    var items: [HomeUIItem] = []
    
    init(delegate: HomeAdapterDelegate) {
        self.delegate = delegate
    }
}

// MARK: - Extensions

extension HomeTableViewAdapter: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch items[section] {
        case .data(let data):
            return data.matches.count
        case .noMatches:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch items[section] {
        case .data(let data):
            let leagueHeaderSection = LeagueHeaderSection.loadFromNibNamed(nibNamed: "LeagueHeaderSection") as! LeagueHeaderSection
            leagueHeaderSection.setItemInformation(itemInformation: data.league)
            return leagueHeaderSection
        case .noMatches:
            return nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.section] {
        case .data(let data):
            let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as! MatchCell
            cell.setItemInformation(itemInformation: data.matches[indexPath.row])
            return cell
        case .noMatches:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoMatchesCell", for: indexPath) as! NoMatchesCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch items[indexPath.section] {
        case .data(_):
            delegate.showMatchDetail()
            break
        case .noMatches:
            break
        }
    }
}
