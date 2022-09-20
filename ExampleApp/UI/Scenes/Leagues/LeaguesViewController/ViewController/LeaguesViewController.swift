//
//  GroupsViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 06/09/2022.
//

import Foundation
import UIKit

class LeaguesViewController: BaseViewController {
 
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private var adapter: LeaguesTableViewAdapter?
    private var viewModel: LeaguesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: LeagueCell.self)
        tableView.separatorStyle = .none
        adapter = LeaguesTableViewAdapter(delegate: self)
        tableView.dataSource = adapter
        tableView.delegate = adapter
        viewModel = LeaguesViewModel(delegate: self)
        showLoading()
        viewModel?.loadData()
    }
    
}

extension LeaguesViewController: LeaguesViewModelDelegate {
    func onSuccess(responseCase: LeaguesSuccessResponse) {
        hideLoading()
        if let viewModel = viewModel, let uiItems = viewModel.uiItems, let adapter = adapter {
            adapter.items = uiItems
            tableView.reloadData()
        } else {
            showError(title: NSLocalizedString("Error.title", comment: ""), description: NSLocalizedString("Error.genericDescription", comment: ""))
        }
    }

    func onError(error: String) {
        showError(title: NSLocalizedString("Error.title", comment: ""), description: error)
    }
}

extension LeaguesViewController: LeaguesAdapterDelegate {
    func showLeagueDetail(leaguesInformation: LeaguesInformation) {
        performSegue(withIdentifier: "showLeagueDetail", sender: leaguesInformation.code)
    }
}

extension LeaguesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLeagueDetail" {
            if let leagueDetailViewController = segue.destination as? LeagueDetailViewController, let sender = sender as? String{
                leagueDetailViewController.viewModel.leagueCode = sender
            } else {
                showError(title: NSLocalizedString("Error.title", comment: ""), description: NSLocalizedString("Error.genericDescription", comment: ""))
            }
        }
    }
}

