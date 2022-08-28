//
//  ProfileViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 29/08/2022.
//

import UIKit
import FirebaseAuth

class ProfileViewController: BaseViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userMailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
}
