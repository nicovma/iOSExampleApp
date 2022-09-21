//
//  LeagueCell.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 19/09/2022.
//

import Foundation
import UIKit

class LeagueCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var matchDayLabel: UILabel!
    @IBOutlet weak var nationLabel: UILabel!
    @IBOutlet weak var nationImageView: UIImageView!
    @IBOutlet weak var nationView: UIView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    
        nationView.layer.cornerRadius = nationView.frame.size.width/2
        nationView.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
        nationView.layer.borderWidth = 2
        
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: LeaguesInformation){
        if let nationImage = itemInformation.nationImage {
            nationImageView.loadAvatar(url: URL.init(string: nationImage)!, placeholder: "exclamationmark.shield.fill")
        }
        logoImageView.loadAvatar(url: URL.init(string: itemInformation.image)!, placeholder: "flag.slash.fill")
        nameLabel.text = itemInformation.name
        matchDayLabel.text = NSLocalizedString("LeagueCell.matchDay", comment: "")  + itemInformation.matchDay
        nationLabel.text = itemInformation.nationName        
    }
}
