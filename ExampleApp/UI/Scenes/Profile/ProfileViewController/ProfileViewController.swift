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
        guard let url = URL(string: "https://lh3.googleusercontent.com/a-/AFdZucrcimoTZissNrB6TKhCojIRREfmq0rqxUHi_qYnZ50=s96-c") else { return }
        userImageView.setImageWithIndicator(url: url)
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        self.showLoading()
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.logoutSuccess()
        } catch let signOutError as NSError {
            showError(title: "Login Error", description: signOutError.localizedDescription)
        }
    }
    
    
}
