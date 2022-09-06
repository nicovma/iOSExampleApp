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
        
        let phoneInformation: PhoneInformation = PhoneInformation(number: "+4571510402")
        let phoneUiItem: ProfileUIItem = .phoneUIItem(phoneInformation)
        
        let logoutUiItem: ProfileUIItem = .logoutUIItem
        
        return [nameUiItem,phoneUiItem, logoutUiItem]
    }
    
    var userModel: User? = nil
    
    // MARK: - Public methods
    
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
