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
    private var viewModel: ProfileViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: ProfileNameCell.self)
        tableView.register(cell: ProfileOptionCell.self)
        tableView.register(cell: NotSelectedFavoriteTeamCell.self)
        tableView.separatorStyle = .none
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
                tableView.reloadData()
            } else {
                showError(title: NSLocalizedString("Error.title", comment: ""), description: NSLocalizedString("Error.genericDescription", comment: ""))
            }
        }
    }
    
    func onError(error: String) {
        hideLoading()
        adapter?.items = []
        tableView.reloadData()
        showError(title: NSLocalizedString("Error.title", comment: ""), description: error)
    }
}

extension ProfileViewController: ProfileAdapterDelegate {
    func onLogoutPress() {
        if let viewModel = viewModel {
            showLoading()
            viewModel.logout()
        } else {
            showError(title: NSLocalizedString("Error.title", comment: ""), description: NSLocalizedString("Error.logoutDescription", comment: ""))
        }
    }
}
