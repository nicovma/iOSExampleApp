//
//  ProfileTableViewAdapter.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 03/09/2022.
//

import Foundation
import UIKit

// MARK: - Properties

class ProfileTableViewAdapter: NSObject {
    // MARK: - Properties
    
    var delegate: ProfileAdapterDelegate
    var items: [ProfileUIItem] = []
    
    init(delegate: ProfileAdapterDelegate) {
        self.delegate = delegate
    }
}

// MARK: - Extensions

extension ProfileTableViewAdapter: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.row] {
        case .nameUIItem(let nameInformation):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileNameCell", for: indexPath) as! ProfileNameCell
            cell.setItemInformation(itemInformation: nameInformation)
            return cell
        case .optionUIItem(let optionInformation):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileOptionCell", for: indexPath) as! ProfileOptionCell
            cell.setItemInformation(itemInformation: optionInformation)
            return cell
        case .notTeamSelected:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotSelectedFavoriteTeamCell", for: indexPath) as! NotSelectedFavoriteTeamCell
            return cell
        case .selectedTeam(let selecTeam):
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTeamCell", for: indexPath) as! FavoriteTeamCell
            cell.setItemInformation(itemInformation: selecTeam)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch items[indexPath.row] {
        case .nameUIItem(_):
            break
        case .optionUIItem(let optionInformation):
            switch optionInformation.type {
            case .termsAndConditions:
                break
            case .logout:
                delegate.logoutPressed()
            case .privacy:
                break
            }
        case .notTeamSelected:
            delegate.selectLeaguePressed()
        case .selectedTeam(let selectTeam):
            delegate.showFavoriteTeam(team: selectTeam)
        }
    }
}
