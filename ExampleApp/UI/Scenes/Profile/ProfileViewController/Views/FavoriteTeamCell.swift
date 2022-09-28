//
//  FavoriteTeamCell.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/09/2022.
//

import Foundation
import UIKit

class FavoriteTeamCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var seeDetailsLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: SelectTeam){
        seeDetailsLabel.text = NSLocalizedString("FavoriteTeamCell.seeDetails", comment: "")
        teamNameLabel.text = itemInformation.name
        teamImageView.loadAvatar(url: URL.init(string: itemInformation.image)!, placeholder: "exclamationmark.shield.fill")
    }
    
}
