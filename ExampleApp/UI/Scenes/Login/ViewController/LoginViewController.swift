//
//  LoginViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 27/08/2022.
//

import Foundation
import UIKit
import GoogleSignIn
import FirebaseAuth

class LoginViewController: BaseViewController {

    // MARK: - Outlets
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
    }
    
    // MARK: - Actions and selectors
    
    @IBAction func signIn(sender: Any) {
        showLoading()
//        GIDSignIn.sharedInstance.signIn(with: GoogleConfig.shared.getSingInConfig(), presenting: self) { [unowned self] user, error in
//
//            if let error = error {
//                hideLoading()
//                showError(title: NSLocalizedString("Error.title", comment: ""), description: error.localizedDescription)
//                return
//            }
//            guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
//
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                         accessToken: authentication.accessToken)
//            Auth.auth().signIn(with: credential) { (authResult, error) in
//                if let error = error {
//                    print(error.localizedDescription)
//                } else {
//                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.loginSuccess()
//                }
//            }
//        }
    }
}
