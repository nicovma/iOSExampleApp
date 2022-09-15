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
    
    @IBOutlet weak var noMatchesLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        noMatchesLabel.text = NSLocalizedString("NoMatchesCell.noMatches", comment: "")
    }
}
