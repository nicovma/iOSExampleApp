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
    var items: [ProfileUIItem] = []
}

// MARK: - Extensions

extension ProfileTableViewAdapter: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch items[indexPath.row] {
        case .nameUIItem(let nameInformation):
            cell = tableView.dequeueReusableCell(withIdentifier: "ProfileNameCell", for: indexPath)
        case .phoneUIItem(let phoneInformation):
            cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePhoneCell", for: indexPath)
        case .logoutUIItem:
            cell = tableView.dequeueReusableCell(withIdentifier: "ProfileNameCell", for: indexPath)
        }
        
        return cell

    }
}
