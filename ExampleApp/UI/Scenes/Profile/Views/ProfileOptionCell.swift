//
//  PhoneInformationCell.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 03/09/2022.
//

import Foundation
import UIKit

class ProfileOptionCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var optionImageView: UIImageView!
    @IBOutlet weak var optionLabel: UILabel!
    
    var optionType: OptionType?
    
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: ProfileOptionInformation){
        optionLabel.text = itemInformation.title
        optionImageView.image = UIImage(systemName: itemInformation.image)
        optionType = itemInformation.type
        let accentColor = UIColor(named: "AccentColor")
        switch optionType {
        case .some(.termsAndConditions):
            optionLabel.textColor = accentColor
            optionImageView.tintColor = accentColor
        case .none:
            optionLabel.textColor = accentColor
            optionImageView.tintColor = accentColor
        case .some(.logout):
            optionLabel.textColor = .red
            optionImageView.tintColor = .red
        case .some(.privacy):
            optionLabel.textColor = accentColor
            optionImageView.tintColor = accentColor
        }
    }
    
}
