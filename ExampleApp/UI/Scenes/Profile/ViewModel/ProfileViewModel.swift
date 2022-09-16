//
//  ProfileViewModel.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 03/09/2022.
//

import Foundation
import FirebaseAuth

class ProfileViewModel {
    
    // MARK: - Properties
    
    var delegate: ProfileViewModelDelegate
    
    var uiItems: [ProfileUIItem]? {
        guard let userModel = userModel else { return nil }
        
        guard let imageUrl = userModel.photoURL, let name = userModel.displayName, let email = userModel.email else { return nil }
        
        let nameInformation: NameInformation = NameInformation(name: name, email: email, imageUrl: imageUrl)
        let nameUiItem: ProfileUIItem = .nameUIItem(nameInformation)
        
        let logoutInformation: ProfileOptionInformation = ProfileOptionInformation(title: NSLocalizedString("ProfileViewModel.logout", comment: ""), image: "arrow.uturn.right", type: .logout)
        let logoutUiItem: ProfileUIItem = .optionUIItem(logoutInformation)
        
        let privacyInformation: ProfileOptionInformation = ProfileOptionInformation(title: NSLocalizedString("ProfileViewModel.privacy", comment: ""), image: "hand.raised", type: .privacy)
        let privacyUiItem: ProfileUIItem = .optionUIItem(privacyInformation)
        
        let termsAndConditionsInformation: ProfileOptionInformation = ProfileOptionInformation(title: NSLocalizedString("ProfileViewModel.termsAndConditions", comment: ""), image: "book", type: .termsAndConditions)
        let termsAndConditionsUiItem: ProfileUIItem = .optionUIItem(termsAndConditionsInformation)
        
        
        return [nameUiItem, privacyUiItem, termsAndConditionsUiItem, logoutUiItem]
    }
    
    var userModel: User? = nil
    
    // MARK: - Publics methods
    
    init(delegate: ProfileViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadData() {
        userModel = Auth.auth().currentUser
        delegate.onSuccess(responseCase: .loadData)
    }
    
    func logout() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            delegate.onSuccess(responseCase: .logout)
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.logoutSuccess()
        } catch let signOutError as NSError {
            delegate.onError(error: signOutError.localizedDescription)
        }
    }
}
