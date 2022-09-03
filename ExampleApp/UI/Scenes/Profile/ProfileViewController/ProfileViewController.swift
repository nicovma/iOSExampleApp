//
//  ProfileViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 29/08/2022.
//

import UIKit
import FirebaseAuth

class ProfileViewController: BaseViewController {
        
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    let adapter: ProfileTableViewAdapter = ProfileTableViewAdapter()
    
    // MARK: - ViewModel
    
    //let employeesViewModel: EmployeesViewModel = EmployeesViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: ProfileNameCell.self)
        tableView.register(cell: ProfilePhoneCell.self)
        tableView.dataSource = adapter
        tableView.delegate = adapter
        let uiItems: [ProfileUIItem] = [.nameUIItem(NameInformation(name: "Nicolas", email: "Valentini", imageUrl: "https://lh3.googleusercontent.com/a-/AFdZucrcimoTZissNrB6TKhCojIRREfmq0rqxUHi_qYnZ50=s96-c")),.phoneUIItem(PhoneInformation(number: "+4571510402")),.logoutUIItem]
        adapter.items = uiItems
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        self.showLoading()
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.logoutSuccess()
        } catch let signOutError as NSError {
            showError(title: "Logout Error!", description: signOutError.localizedDescription)
        }
    }
    
    
}
