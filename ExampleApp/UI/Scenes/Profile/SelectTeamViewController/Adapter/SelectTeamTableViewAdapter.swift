//
//  SelectTeamTableViewAdapter.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/09/2022.
//

import Foundation
import UIKit

// MARK: - Properties

class SelectTeamTableViewAdapter: NSObject {
    
    // MARK: - Properties
    
    var delegate: SelectTeamAdapterDelegate
    var items: [SelectTeamUIItem] = []

    init(delegate: SelectTeamAdapterDelegate) {
        self.delegate = delegate
    }
}

// MARK: - Extensions

extension SelectTeamTableViewAdapter: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.row] {
        case .team(let selectTeam):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectTeamCell", for: indexPath) as! SelectTeamCell
            cell.setItemInformation(itemInformation: selectTeam)
            return cell
        }

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch items[indexPath.row] {
        case .team(let selectTeam):
            delegate.selectedTeam(team: selectTeam)
        }
    }
}
