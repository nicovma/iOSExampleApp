//
//  ProfileNameCell.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 03/09/2022.
//

import Foundation
import UIKit

class ProfileNameCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        userImageView.layer.cornerRadius = userImageView.frame.size.width/2
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: NameInformation){
        usernameLabel.text = itemInformation.name
        emailLabel.text = itemInformation.email
        userImageView.loadAvatar(url: itemInformation.imageUrl, placeholder: "person")
    }
    
}
