//
//  LeaguesTableViewAdapter.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 19/09/2022.
//

import Foundation
import UIKit

// MARK: - Properties

class LeaguesTableViewAdapter: NSObject {
    
    // MARK: - Properties
    
    var delegate: LeaguesAdapterDelegate
    var items: [LeaguesUIItem] = []

    init(delegate: LeaguesAdapterDelegate) {
        self.delegate = delegate
    }
}

// MARK: - Extensions

extension LeaguesTableViewAdapter: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.row] {
        case .data(let leaguesInformation):
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeagueCell
            cell.setItemInformation(itemInformation: leaguesInformation)
            return cell
        }

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch items[indexPath.row] {
        case .data(let leaguesInformation):
            delegate.showLeagueDetail(leaguesInformation: leaguesInformation)
        }
    }
}
