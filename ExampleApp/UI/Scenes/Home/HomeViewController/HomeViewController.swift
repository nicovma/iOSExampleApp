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
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Properties
    
    private var adapter: HomeTableViewAdapter?
    private var viewModel: HomeViewModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: MatchCell.self)
        tableView.register(cell: NoMatchesCell.self)
        tableView.separatorStyle = .none
        adapter = HomeTableViewAdapter(delegate: self)
        tableView.dataSource = adapter
        tableView.delegate = adapter
        viewModel = HomeViewModel(delegate: self)
        dateLabel.text = viewModel?.dateText
        searchData()
    }
    
    // MARK: - Actions and selectors
    @IBAction func buttonNextPressed(_ sender: Any) {
        viewModel?.addDay(quantity: 1)
        searchData()
    }
    
    @IBAction func buttonBackPressed(_ sender: Any) {
        viewModel?.subtractDay(quantity: 1)
        searchData()
    }
    
    // MARK: - public methods
    
    func searchData() {
        showLoading()
        viewModel?.loadData()
    }

}

extension HomeViewController: HomeViewModelDelegate {
    
    func onSuccess(responseCase: HomeSuccessResponse) {
        dateLabel.text = viewModel?.dateText
        hideLoading()
        switch responseCase {   
        case .loadData:
            if let viewModel = viewModel, let uiItems = viewModel.uiItems, let adapter = adapter {
                adapter.items = uiItems
                tableView.reloadData()
            } else {
                showError(title: "Error!", description: "Error inesperado.")
            }
        }
    }
    
    func onError(error: String) {
        hideLoading()
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
