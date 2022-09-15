//
//  NoMatchesCell.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 15/09/2022.
//

import Foundation
import UIKit

class NoMatchesCell: UITableViewCell {
    
    // MARK: - Outlets
    
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
