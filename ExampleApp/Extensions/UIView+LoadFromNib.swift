//
//  UIView+LoadFromNib.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/08/2022.
//

import UIKit

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle: Bundle? = nil) -> UIView? {
      return UINib(
          nibName: nibNamed,
          bundle: bundle
      ).instantiate(withOwner: nil, options: nil)[0] as? UIView
  }
}
