//
//  ProfileViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 29/08/2022.
//

import UIKit

class ProfileViewController: BaseViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private var adapter: ProfileTableViewAdapter?
    
    // MARK: - ViewModel
    
    private var viewModel: ProfileViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: ProfileNameCell.self)
        tableView.register(cell: ProfilePhoneCell.self)
        adapter = ProfileTableViewAdapter(delegate: self)
        tableView.dataSource = adapter
        tableView.delegate = adapter
        viewModel = ProfileViewModel(delegate: self)
        showLoading()
        viewModel?.loadData()
    }
}

extension ProfileViewController: ProfileViewModelDelegate {
    func onSuccess(responseCase: ProfileSuccessResponse) {
        hideLoading()
        switch responseCase {
        case .logout:
            break
        case .loadData:
            if let viewModel = viewModel, let uiItems = viewModel.uiItems, let adapter = adapter {
                adapter.items = uiItems
            } else {
                showError(title: "Error!", description: "Error inesperado.")
            }
        }
    }
    
    func onError(error: String) {
        showError(title: "Error!", description: error)
    }
    
    
}

extension ProfileViewController: ProfileAdapterDelegate {
    func onLogoutPress() {
        if let viewModel = viewModel {
            showLoading()
            viewModel.logout()
        } else {
            showError(title: "Error!", description: "Logout error")
        }
    }
}
