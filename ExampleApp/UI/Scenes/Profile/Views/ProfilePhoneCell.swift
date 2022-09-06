//
//  PhoneInformationCell.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 03/09/2022.
//

import Foundation
import UIKit

class ProfilePhoneCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var phoneImageView: UIImageView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: PhoneInformation){
        phoneNumberLabel.text = itemInformation.number
    }
    
}
