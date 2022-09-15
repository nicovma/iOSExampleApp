//
//  UIImageView+Download.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 29/08/2022.
//
import UIKit
import Kingfisher

public extension UIImageView {
    
    func loadAvatar(url: URL, placeholder: String) {
        self.kf.setImage(with: url, placeholder: UIImage(systemName: placeholder), options: [.transition(.fade(0.2))])
    }

    func setImageWithIndicator(url: URL) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }
}
