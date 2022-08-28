//
//  ErrorView.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 27/08/2022.
//

import UIKit

class ErrorView: UIView {
    
    @IBOutlet weak var errorTitleLabel: UILabel!
    @IBOutlet weak var errorDescriptionLabel: UILabel!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @IBAction func okPressed(_ sender: Any) {
        removeFromSuperview()
    }
}
