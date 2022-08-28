//
//  HomeViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 27/08/2022.
//

import Foundation
import UIKit


class HomeViewController: BaseViewController {

    // MARK: - Outlets
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //showNavigationBar()
    }
    
    // MARK: - Actions and selectors
    
    @IBAction func showLoader(_ sender: Any) {
        self.showError(title: "Title", description: "Description")
    }
    

    // MARK: - public methods

    
}
