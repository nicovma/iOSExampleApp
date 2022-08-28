//
//  HomeViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 27/08/2022.
//

import Foundation
import UIKit
import FirebaseAuth

class HomeViewController: ExampleAPPViewController {

    // MARK: - Outlets
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions and selectors
    
    @IBAction func showLoader(_ sender: Any) {
        self.showError()
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        self.showLoading()
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.logoutSuccess()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }

    // MARK: - public methods

    
}
