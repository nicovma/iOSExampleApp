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
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: String){
        //nameLabel.text = itemInformation
        teamImageView.loadAvatar(url: URL.init(string: "https://crests.football-data.org/115.png")!, placeholder: "exclamationmark.shield.fill")
    }
}
