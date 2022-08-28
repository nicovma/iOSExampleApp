//
//  GoogleConfig.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 27/08/2022.
//

import Foundation
import GoogleSignIn
import FirebaseCore

class GoogleConfig {
    
    // Create Google Sign In configuration object.
    let signInConfig = GIDConfiguration(clientID: FirebaseApp.app()?.options.clientID ?? "")
    
    static var shared: GoogleConfig = {
        let instance = GoogleConfig()
        // configure the instance
        return instance
    }()
    
    private init() {}
    
    func getSingInConfig() -> GIDConfiguration {
        return signInConfig
    }
}
