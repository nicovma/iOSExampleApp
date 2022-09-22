//
//  LeagueDetailScoreCell.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 20/09/2022.
//

import Foundation
import UIKit

class LeagueDetailScoreCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var assistsLabel: UILabel!
    @IBOutlet weak var showAllButton: UIButton!
    @IBOutlet weak var numberView: UIView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: ScoreInformation){
        nameLabel.text = itemInformation.name
        teamImageView.loadAvatar(url: URL.init(string: itemInformation.teamImage)!, placeholder: "exclamationmark.shield.fill")
        teamLabel.text = itemInformation.teamName
        goalsLabel.text = NSLocalizedString("PositionSectionHeaderView.goals", comment: "") + itemInformation.goals
        assistsLabel.text = NSLocalizedString("PositionSectionHeaderView.assists", comment: "") + itemInformation.assists
        showAllButton.setTitle(NSLocalizedString("PositionSectionHeaderView.seeAllButton", comment: ""), for: .normal)
        showAllButton.isHidden = true
        if let shirtNumber = itemInformation.shirtNumber {
            numberLabel.text = shirtNumber
            numberLabel.isHidden = false
            numberView.isHidden = false
        } else {
            numberLabel.isHidden = true
            numberView.isHidden = true
        }
    }
}
