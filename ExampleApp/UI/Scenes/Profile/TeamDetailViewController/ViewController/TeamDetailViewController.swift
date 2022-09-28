//
//  TeamDetailViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/09/2022.
//

import Foundation
import UIKit

class TeamDetailViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions and selectors
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "SelectedTeam")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showEditTeam", sender: nil)
    }
}
