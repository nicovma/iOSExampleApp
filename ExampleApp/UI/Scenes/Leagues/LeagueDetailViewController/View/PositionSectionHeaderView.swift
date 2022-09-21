//
//  PositionSectionHeaderView.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 21/09/2022.
//

import Foundation
import UIKit

class PositionSectionHeaderView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pLabel: UILabel!
    @IBOutlet weak var wLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var dgLabel: UILabel!
    @IBOutlet weak var ptsLabel: UILabel!
    
    // MARK: - Lifecycle

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: LeagueDetailUIItem) {
        var showPositionLabels = true
        if case .position = itemInformation {
            showPositionLabels = false
        }
        pLabel.isHidden = showPositionLabels
        wLabel.isHidden = showPositionLabels
        dLabel.isHidden = showPositionLabels
        lLabel.isHidden = showPositionLabels
        dgLabel.isHidden = showPositionLabels
        ptsLabel.isHidden = showPositionLabels
        
        switch itemInformation {
        case .position(_):
            titleLabel.text = NSLocalizedString("LeagueDetailViewController.position", comment: "")
        case .resume(_):
            titleLabel.text = NSLocalizedString("LeagueDetailViewController.section.resume", comment: "")
        case .scorer(_):
            titleLabel.text = NSLocalizedString("LeagueDetailViewController.section.scorer", comment: "")
        }
    }
}
