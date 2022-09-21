//
//  LeaguePositionCell.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 20/09/2022.
//

import Foundation
import UIKit

class LeaguePositionCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var formLabel: UILabel!
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var playedMatchesLabel: UILabel!
    @IBOutlet weak var wonMatchesLabel: UILabel!
    @IBOutlet weak var drawMatchesLabel: UILabel!
    @IBOutlet weak var lostMatchesLabel: UILabel!
    @IBOutlet weak var goalDifferenceLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: LeaguePositionInformation){
        positionLabel.text = itemInformation.position
        teamNameLabel.text = itemInformation.name
        teamImageView.loadAvatar(url: URL.init(string: itemInformation.image)!, placeholder: "exclamationmark.shield.fill")
        
        formLabel.isHidden = itemInformation.form == nil
        formView.isHidden = itemInformation.form == nil
        if let teamForm = itemInformation.form {
            formLabel.text = teamForm
        }
        
        playedMatchesLabel.text = itemInformation.played
        wonMatchesLabel.text = itemInformation.wins
        drawMatchesLabel.text = itemInformation.draw
        lostMatchesLabel.text = itemInformation.lost
        goalDifferenceLabel.text = String(itemInformation.goalDifference)
        
        switch itemInformation.goalDifference {
            case let x where x > 0:
            goalDifferenceLabel.textColor = UIColor.green
            case let x where x < 0:
            goalDifferenceLabel.textColor = UIColor.red
            default:
                break
        }
                
        pointsLabel.text = itemInformation.points
        
    }
}
