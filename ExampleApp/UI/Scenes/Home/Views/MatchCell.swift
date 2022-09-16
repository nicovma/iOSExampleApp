//
//  MatchCell.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 12/09/2022.
//

import Foundation
import UIKit

class MatchCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var awayTeamImageView: UIImageView!
    
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: MatchInformation) {
        homeTeamImageView.loadAvatar(url: URL.init(string: itemInformation.homeTeamImage)!, placeholder: "exclamationmark.shield.fill")
        awayTeamImageView.loadAvatar(url: URL.init(string: itemInformation.awayTeamImage)!, placeholder: "exclamationmark.shield.fill")
        homeTeamNameLabel.text = itemInformation.homeTeamName
        awayTeamNameLabel.text = itemInformation.awayTeamName
        homeTeamScoreLabel.text = itemInformation.homeTeamScore
        awayTeamScoreLabel.text = itemInformation.awayTeamScore
        statusLabel.text = itemInformation.statusText
        switch itemInformation.status {
        case .paused:
            statusView.backgroundColor = UIColor.gray
            statusLabel.textColor = UIColor.white
        case .finished:
            statusView.backgroundColor = UIColor.black
            statusLabel.textColor = UIColor.white
        case .timed:
            statusView.backgroundColor = UIColor.clear
            statusLabel.textColor = UIColor.black
        case .postponed:
            statusView.backgroundColor = UIColor.red
            statusLabel.textColor = UIColor.white
        case .playing:
            statusView.backgroundColor = UIColor.green
            statusLabel.textColor = UIColor.white
        }
    }
}
