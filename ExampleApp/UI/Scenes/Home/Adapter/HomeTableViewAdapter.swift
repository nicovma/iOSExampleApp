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
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.row] {
            
        case .noTask(let notTaskInformation):
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeNotTaskCell", for: indexPath) as! HomeNotTaskCell
            cell.setItemInformation(itemInformation: notTaskInformation)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch items[indexPath.row] {
        case .noTask(let notTaskInformation):
            switch notTaskInformation.notTaskType {
            case .createGroup:
                delegate.createGroup()
            case .joinToGroup:
                delegate.joinGroup()
            }
        }
            
    }
}
