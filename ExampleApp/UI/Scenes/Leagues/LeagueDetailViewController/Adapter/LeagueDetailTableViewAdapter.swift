//
//  LeagueDetailTableViewAdapter.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 20/09/2022.
//

import Foundation
import UIKit

// MARK: - Properties

class LeagueDetailTableViewAdapter: NSObject {
    
    // MARK: - Properties
    
//    var delegate: LeaguesAdapterDelegate
    var items: [LeagueDetailUIItem] = []
}

// MARK: - Extensions

extension LeagueDetailTableViewAdapter: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch items[section] {
        case .position(let leagueTablesInformation):
            var total = leagueTablesInformation.tables.count
            for table in leagueTablesInformation.tables {
                total = total + table.position.count
            }
            return total
        case .resume(_):
            return 1
        case .scorer(_):
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.section] {
        case .position(let leagueTablesInformation):
            let groupQuantity = leagueTablesInformation.tables[0].position.count + 1
            if (indexPath.row % groupQuantity == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueTableHeaderCell", for: indexPath) as! LeagueTableHeaderCell
                cell.setItemInformation(itemInformation: leagueTablesInformation.tables[indexPath.row/groupQuantity].name)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguePositionCell", for: indexPath) as! LeaguePositionCell
                let cellInformation = leagueTablesInformation.tables[indexPath.row/groupQuantity].position[(indexPath.row%groupQuantity)-1]
                cell.setItemInformation(itemInformation: cellInformation)
                return cell
            }

            
        case .resume(_):
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueDetailResumeCell", for: indexPath) as! LeagueDetailResumeCell
            
            return cell
            
        case .scorer(_):
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueDetailScoreCell", for: indexPath) as! LeagueDetailScoreCell
            
            return cell
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let positionSectionHeaderView = PositionSectionHeaderView.loadFromNibNamed(nibNamed: "PositionSectionHeaderView") as! PositionSectionHeaderView
        positionSectionHeaderView.setItemInformation(itemInformation: items[section])
        return positionSectionHeaderView
    }
}
