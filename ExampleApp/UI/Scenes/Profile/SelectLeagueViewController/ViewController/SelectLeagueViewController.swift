//
//  SelectLeagueViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/09/2022.
//

import Foundation
import UIKit

class SelectLeagueViewController: BaseViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    
    private var adapter: SelectLeagueTableViewAdapter?
    private var viewModel: SelectLeagueViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = NSLocalizedString("SelectLeagueViewController.title", comment: "")
        tableView.register(cell: LeagueCell.self)
        tableView.separatorStyle = .none
        adapter = SelectLeagueTableViewAdapter(delegate: self)
        tableView.dataSource = adapter
        tableView.delegate = adapter
        viewModel = SelectLeagueViewModel(delegate: self)
        showLoading()
        viewModel?.loadData()
    }
    
    // MARK: - Actions and selectors
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SelectLeagueViewController: SelectLeagueViewModelDelegate {
    func onSuccess(responseCase: SelectLeagueSuccessResponse) {
        hideLoading()
        if let viewModel = viewModel, let uiItems = viewModel.uiItems, let adapter = adapter {
            adapter.items = uiItems
            tableView.reloadData()
        } else {
            showError(title: NSLocalizedString("Error.title", comment: ""), description: NSLocalizedString("Error.genericDescription", comment: ""))
        }
    }

    func onError(error: String) {
        adapter?.items = []
        tableView.reloadData()
        showError(title: NSLocalizedString("Error.title", comment: ""), description: error)
    }
}

extension SelectLeagueViewController: SelectLeagueAdapterDelegate {
    func showLeagueDetail(leaguesInformation: LeaguesInformation) {
        performSegue(withIdentifier: "showSelectTeam", sender: leaguesInformation.code)  
    }

}

extension SelectLeagueViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSelectTeam" {
            if let selectTeamViewController = segue.destination as? SelectTeamViewController, let sender = sender as? String{
                selectTeamViewController.viewModel.leagueCode = sender
            } else {
                showError(title: NSLocalizedString("Error.title", comment: ""), description: NSLocalizedString("Error.genericDescription", comment: ""))
            }
        }
    }
}
