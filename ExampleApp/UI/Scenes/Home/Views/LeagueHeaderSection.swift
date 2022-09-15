//
//  LeagueHeaderSection.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 12/09/2022.
//

import Foundation
import UIKit

class LeagueHeaderSection: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Lifecycle

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: LeagueInformation) {
        flagImageView.loadAvatar(url: URL.init(string: itemInformation.image)!, placeholder: "flag.slash.fill")
        nameLabel.text = itemInformation.name
    }
}
