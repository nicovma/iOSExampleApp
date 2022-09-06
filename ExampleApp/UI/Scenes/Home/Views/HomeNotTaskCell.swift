//
//  HomeNotTaskCell.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 06/09/2022.
//

import Foundation
import UIKit

class HomeNotTaskCell: UITableViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: NotTaskInformation) {
        self.titleLabel.text = itemInformation.title
    }
}

