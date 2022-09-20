//
//  LeaguePositionCell.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 20/09/2022.
//

import Foundation
import UIKit

class LeaguePositionCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var positionLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: String){
        positionLabel.text = itemInformation
    }
}
