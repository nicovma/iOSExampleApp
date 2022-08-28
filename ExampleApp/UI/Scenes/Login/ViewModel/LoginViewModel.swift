//
//  LoginViewModel.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 27/08/2022.
//

import Foundation


class LoginViewModel : NSObject {
    
    // MARK: - Properties
    
    weak var delegate: FirebaseLoginDelegate?
    
    //MARK: - Public Methods
    
    func userAuth() {
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//
//        // Create Google Sign In configuration object.
//        let config = GIDConfiguration(clientID: clientID)
//
//        // Start the sign in flow!
//        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
//
//          if let error = error {
//            // ...
//            return
//          }
//
//          guard
//            let authentication = user?.authentication,
//            let idToken = authentication.idToken
//          else {
//            return
//          }
//
//          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                         accessToken: authentication.accessToken)
//
//          // ...
//        }
    }
}
