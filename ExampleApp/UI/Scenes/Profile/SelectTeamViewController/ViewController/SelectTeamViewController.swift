//
//  SelectTeamViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/09/2022.
//

import Foundation
import UIKit

class SelectTeamViewController: BaseViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    
    private var adapter: SelectTeamTableViewAdapter?
    var viewModel: SelectTeamViewModel = SelectTeamViewModel()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = NSLocalizedString("SelectTeamViewController.title", comment: "")
        tableView.register(cell: SelectTeamCell.self)
        tableView.separatorStyle = .none
        adapter = SelectTeamTableViewAdapter(delegate: self)
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

extension SelectTeamViewController: SelectTeamViewModelDelegate {
    func onSuccess(responseCase: SelectTeamSuccessResponse) {
        hideLoading()
        if let uiItems = viewModel.uiItems, let adapter = adapter {
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

extension SelectTeamViewController: SelectTeamAdapterDelegate {
    func selectedTeam(team: SelectTeam) {
        let refreshAlert = UIAlertController(title: team.name,
                                             message: NSLocalizedString("SelectTeamViewController.dialogBodyText", comment: ""),
                                             preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Generics.yes", comment: ""),
                                             style: .default,
                                             handler: { (action: UIAlertAction!) in
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(team)
                UserDefaults.standard.set(data, forKey: "SelectedTeam")
                self.navigationController?.popToRootViewController(animated: true)

            } catch {
                self.showError(title: NSLocalizedString("Error.title", comment: ""), description: error.localizedDescription)
            }
        }))

        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Generics.cancel", comment: ""),
                                             style: .cancel,
                                             handler: { (action: UIAlertAction!) in
            self.dismiss(animated: false)
        }))
        present(refreshAlert, animated: true, completion: nil)
    }
}
