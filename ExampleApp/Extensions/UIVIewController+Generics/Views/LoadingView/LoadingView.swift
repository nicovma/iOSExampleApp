//
//  LoadingView.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 27/08/2022.
//

import UIKit

class LoadingView: UIView {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
