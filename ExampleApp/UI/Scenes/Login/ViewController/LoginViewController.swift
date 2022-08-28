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

class LoginViewController: ExampleAPPViewController, FirebaseLoginDelegate {

    // MARK: - Outlets
    
    // MARK: - Properties
    
    private var loginViewModel: LoginViewModel = LoginViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        loginViewModel.delegate = self
    }
    
    // MARK: - Actions and selectors
    
    @IBAction func signIn(sender: Any) {
        showLoading()
        loginViewModel.userAuth()
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: GoogleConfig.shared.getSingInConfig(), presenting: self) { [unowned self] user, error in

            if let error = error {
                // ...
                return
            }

            guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Login success")
                    //This is where you should add the functionality of successful login
                    //i.e. dismissing this view or push the home view controller etc
//                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LogginSuccess"), object: nil)
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.loginSuccess()
                }
            }
        }
    }

    // MARK: - public methods
    
    func loginSuccess() {
        print("Loged")
    }
    
    func loginFinishedWithError(msg: String) {
        print(msg)
    }
}
