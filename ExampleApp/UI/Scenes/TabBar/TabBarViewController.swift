//
//  TabBarViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 29/08/2022.
//

import UIKit;

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // HomeViewController
        let homeViewController = UIStoryboard(name: "HomeViewController", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        // sf symbols to add new image
        let homeBarItem = UITabBarItem(title: "Partidos", image: UIImage(systemName: "sportscourt"), tag: 0)
        homeViewController.tabBarItem = homeBarItem
        // Add notification
        //hvc.tabBarItem.badgeValue = "3";
        
        // GroupViewController
        let groupViewController = UIStoryboard(name: "GroupsViewController", bundle: nil).instantiateViewController(withIdentifier: "GroupsViewController") as! GroupsViewController
        let groupBarItem = UITabBarItem(title: "Grupos", image: UIImage(systemName: "person.3"), tag: 1)
        groupViewController.tabBarItem = groupBarItem
        
        // ProfileViewController
        let profileViewController = UIStoryboard(name: "ProfileViewController", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        let profileBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person"), tag: 2)
        profileViewController.tabBarItem = profileBarItem
        

        let kids: [UIViewController] = [homeViewController, groupViewController, profileViewController]
        
        
        setViewControllers(kids, animated: true)
        
    }
}
