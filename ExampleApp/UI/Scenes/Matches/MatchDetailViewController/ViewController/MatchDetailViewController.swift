//
//  MatchDetailViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 16/09/2022.
//

import Foundation
import UIKit

class MatchDetailViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private var adapter: MatchDetailTableViewAdapter?
//    private var viewModel: MatchDetailViewModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: TeamsScoreCell.self)
        tableView.separatorStyle = .none
        adapter = MatchDetailTableViewAdapter()
        tableView.dataSource = adapter
        tableView.delegate = adapter
//        viewModel = MatchDetailViewModel(delegate: self)
//        searchData()
    }
    
    // MARK: - Actions and selectors
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - public methods
    
    func searchData() {
        showLoading()
//            viewModel?.loadData()
    }
}

extension MatchDetailViewController: MatchDetailViewModelDelegate {
    
    func onSuccess(responseCase: MatchDetailSuccessResponse) {
        hideLoading()
        switch responseCase {
        case .loadData:
            break
//            if let viewModel = viewModel, let uiItems = viewModel.uiItems, let adapter = adapter {
//                adapter.items = uiItems
//                tableView.reloadData()
//            } else {
//                showError(title: NSLocalizedString("Error.title", comment: ""), description: NSLocalizedString("Error.genericDescription", comment: ""))
//            }
        }
    }

    func onError(error: String) {
        hideLoading()
        showError(title: NSLocalizedString("Error.title", comment: ""), description: error)
    }
}
