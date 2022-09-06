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
        case .phoneUIItem(let phoneInformation):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePhoneCell", for: indexPath) as! ProfilePhoneCell
            cell.setItemInformation(itemInformation: phoneInformation)
            return cell
        case .logoutUIItem:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePhoneCell", for: indexPath) as! ProfilePhoneCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch items[indexPath.row] {
        case .nameUIItem(let nameInformation):
            break
        case .phoneUIItem(let phoneInformation):
            break
        case .logoutUIItem:
            delegate.onLogoutPress()
        }
    }
}
