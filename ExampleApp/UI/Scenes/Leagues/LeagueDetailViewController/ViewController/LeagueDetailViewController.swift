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
    @IBOutlet weak var seasonYearLabel: UILabel!
    @IBOutlet weak var substractYearButton: UIButton!
    @IBOutlet weak var addYearButton: UIButton!
    
    
    // MARK: - Properties
    
    private var adapter: LeagueDetailTableViewAdapter?
    var viewModel: LeagueDetailViewModel = LeagueDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: LeaguePositionCell.self)
        tableView.register(cell: LeagueTableHeaderCell.self)
        tableView.register(cell: LeagueDetailResumeCell.self)
        tableView.register(cell: LeagueDetailScoreCell.self)
        tableView.separatorStyle = .none
        adapter = LeagueDetailTableViewAdapter()
        tableView.dataSource = adapter
        tableView.delegate = adapter
        viewModel.delegate = self
        seasonYearLabel.text = viewModel.yearText
        addYearButton.isHidden = viewModel.isInternationalLeague()
        substractYearButton.isHidden = viewModel.isInternationalLeague()
        searchData()
    }
    
    // MARK: - Actions and selectors
    
    @IBAction func subtractButtonPressed(_ sender: Any) {
        viewModel.substractYear()
        searchData()
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        viewModel.addYear()
        searchData()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Publics methods
    
    func searchData() {
        showLoading()
        viewModel.loadData()
    }
}

extension LeagueDetailViewController: LeagueDetailViewModelDelegate {
    func onSuccess(responseCase: LeagueDetailSuccessResponse) {
        hideLoading()
        seasonYearLabel.text = viewModel.yearText
        if let uiItems = viewModel.uiItems, let adapter = adapter {
            adapter.items = uiItems
            tableView.reloadData()
        } else {
            showError(title: NSLocalizedString("Error.title", comment: ""), description: NSLocalizedString("Error.genericDescription", comment: ""))
        }
    }
    
    func onError(error: String) {
        hideLoading()
        seasonYearLabel.text = viewModel.yearText
        adapter?.items = []
        tableView.reloadData()
        showError(title: NSLocalizedString("Error.title", comment: ""), description: error)
    }
    
    
}
