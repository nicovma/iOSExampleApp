//
//  HomeViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 27/08/2022.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private var adapter: HomeTableViewAdapter?
    private var viewModel: HomeViewModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: HomeNotTaskCell.self)
        tableView.separatorStyle = .none
        adapter = HomeTableViewAdapter(delegate: self)
        tableView.dataSource = adapter
        tableView.delegate = adapter
        viewModel = HomeViewModel(delegate: self)
        showLoading()
        viewModel?.loadData()
    }
    
    // MARK: - Actions and selectors

    // MARK: - public methods

}

extension HomeViewController: HomeViewModelDelegate {
    
    func onSuccess(responseCase: HomeSuccessResponse) {
        hideLoading()
        switch responseCase {   
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

extension HomeViewController: HomeAdapterDelegate {
    
    func createGroup() {
        showDialog()
    }
    
    func joinGroup() {
        showDialog()
    }
    
    
}
