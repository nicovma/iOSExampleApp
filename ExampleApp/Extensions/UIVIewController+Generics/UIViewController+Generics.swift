//
//  UIViewController+Generics.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 27/08/2022.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var loadingView: LoadingView? = nil
    
    func showLoading() {
        let loadingView = LoadingView.loadFromNibNamed(nibNamed: "LoadingView") as! LoadingView
        self.loadingView = loadingView
        loadingView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        loadingView.indicator.startAnimating()
        self.view.addSubview(loadingView)
        self.view.bringSubviewToFront(loadingView)
    }
    
    func hideLoading() {
        loadingView?.removeFromSuperview()
    }
    
    func showError(title: String, description: String) {
        let errorView = ErrorView.loadFromNibNamed(nibNamed: "ErrorView") as! ErrorView
        errorView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        errorView.errorTitleLabel.text = title
        errorView.errorDescriptionLabel.text = description
        self.view.addSubview(errorView)
        self.view.bringSubviewToFront(errorView)
    }
}
