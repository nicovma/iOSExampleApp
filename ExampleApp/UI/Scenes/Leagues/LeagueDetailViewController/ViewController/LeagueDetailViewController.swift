//
//  LeagueDetailViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 20/09/2022.
//

import Foundation
import UIKit

class LeagueDetailViewController: BaseViewController {
 
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private var adapter: LeagueDetailTableViewAdapter?
    var viewModel: LeagueDetailViewModel = LeagueDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: LeaguePositionCell.self)
        tableView.register(cell: LeagueTableHeaderCell.self)
        tableView.separatorStyle = .none
        adapter = LeagueDetailTableViewAdapter()
        tableView.dataSource = adapter
        tableView.delegate = adapter
        viewModel.delegate = self
        showLoading()
        viewModel.loadData()
    }
    
    // MARK: - Actions and selectors
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension LeagueDetailViewController: LeagueDetailViewModelDelegate {
    func onSuccess(responseCase: LeagueDetailSuccessResponse) {
        hideLoading()
        if let uiItems = viewModel.uiItems, let adapter = adapter {
            adapter.items = uiItems
            tableView.reloadData()
        } else {
            showError(title: NSLocalizedString("Error.title", comment: ""), description: NSLocalizedString("Error.genericDescription", comment: ""))
        }
    }
    
    func onError(error: String) {
        
    }
    
    
}
