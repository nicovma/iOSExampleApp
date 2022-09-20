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

//    init(delegate: LeaguesAdapterDelegate) {
//        self.delegate = delegate
//    }
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
                let textToCell = leagueTablesInformation.tables[indexPath.row/groupQuantity].position[(indexPath.row%groupQuantity)-1].name
                cell.setItemInformation(itemInformation: textToCell)
                return cell
            }

            
        case .resume(_):
            return UITableViewCell()
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch items[section] {
        case .position(_):

            return "Posiciones"
        case .resume(_):
            return "Resumen"
        }
    }
}
