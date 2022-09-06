//
//  HomeViewModel.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 06/09/2022.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Properties
    
    var delegate: HomeViewModelDelegate
    
    var uiItems: [HomeUIItem]? {
        return [.noTask(NotTaskInformation(title: "Crear un grupo", notTaskType: .createGroup)), .noTask(NotTaskInformation(title: "Unirse un grupo", notTaskType: .joinToGroup))]
    }
    
    // MARK: - Publics methods
    
    init(delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadData() {
        delegate.onSuccess(responseCase: .loadData)
    }
    
    
}
