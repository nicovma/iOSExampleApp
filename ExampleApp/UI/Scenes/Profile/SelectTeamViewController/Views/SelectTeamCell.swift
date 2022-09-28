//
//  SelectTeamCell.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/09/2022.
//

import Foundation
import UIKit

class SelectTeamCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: SelectTeam){
        teamNameLabel.text = itemInformation.name
        teamImageView.loadAvatar(url: URL.init(string: itemInformation.image)!, placeholder: "exclamationmark.shield.fill")
    }
}
