//
//  MatchDetailTableViewAdapter.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 16/09/2022.
//

import Foundation
import UIKit

// MARK: - Properties

class MatchDetailTableViewAdapter: NSObject {
    
    // MARK: - Properties
    
    //var items: [HomeUIItem] = []

}

// MARK: - Extensions

extension MatchDetailTableViewAdapter: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsScoreCell", for: indexPath) as! TeamsScoreCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
