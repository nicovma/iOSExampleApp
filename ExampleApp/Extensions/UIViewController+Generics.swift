//
//  UIViewController+Generics.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 27/08/2022.
//

import Foundation
import UIKit

class ExampleAPPViewController: UIViewController {
    
    let loadingView = LoadingView.instanceFromNib
    let errorView = ErrorView.instanceFromNib
    
    func showLoading() {
        loadingView().frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(loadingView())
        self.view.bringSubviewToFront(loadingView())
    }
    
    func hideLoading() {
        loadingView().removeFromSuperview()
    }
    
    func showError() {
        errorView().frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        errorView().errorTitleLabel.text = "Title"
        errorView().errorDescriptionLabel.text = "Description"
        self.view.addSubview(errorView())
        self.view.bringSubviewToFront(errorView())
    }
}
