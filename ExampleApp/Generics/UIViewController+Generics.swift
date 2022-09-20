//
//  UIViewController+Generics.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 27/08/2022.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, ErrorViewDelegate {

    var loadingView: LoadingView? = nil
    
    var errorView: ErrorView? = nil
    
    func showLoading() {
        self.tabBarController?.tabBar.isHidden = true
        let loadingView = LoadingView.loadFromNibNamed(nibNamed: "LoadingView") as! LoadingView
        loadingView.setupTitle(title: nil)
        self.loadingView = loadingView
        loadingView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        loadingView.indicator.startAnimating()
        self.view.addSubview(loadingView)
        self.view.bringSubviewToFront(loadingView)
    }
    
    func hideLoading() {
        self.tabBarController?.tabBar.isHidden = false
        loadingView?.removeFromSuperview()
    }
    
    func showError(title: String, description: String) {
        self.tabBarController?.tabBar.isHidden = true
        let errorView = ErrorView.loadFromNibNamed(nibNamed: "ErrorView") as! ErrorView
        errorView.delegate = self
        self.errorView = errorView
        errorView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        errorView.errorTitleLabel.text = title
        errorView.errorDescriptionLabel.text = description
        self.view.addSubview(errorView)
        self.view.bringSubviewToFront(errorView)
    }
    
    func okPressed() {
        self.tabBarController?.tabBar.isHidden = false
        errorView?.removeFromSuperview()
    }
    
    func showDialog() {
        let refreshAlert = UIAlertController(title: "Warning",
                                             message: "you want to permanently delete this item?",
                                             preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Delete",
                                             style: .destructive,
                                             handler: { (action: UIAlertAction!) in
            
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: { (action: UIAlertAction!) in
        }))
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func showNavigationBar() {
        
    }

}
