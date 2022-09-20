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
        let homeBarItem = UITabBarItem(title: NSLocalizedString("TabBarViewController.matches", comment: ""), image: UIImage(systemName: "sportscourt"), tag: 0)
        homeViewController.tabBarItem = homeBarItem
        // Add notification
        //hvc.tabBarItem.badgeValue = "3";
        
        // GroupViewController
        let leagueViewController = UIStoryboard(name: "LeaguesViewController", bundle: nil).instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
        let leagueBarItem = UITabBarItem(title: NSLocalizedString("TabBarViewController.leagues", comment: ""), image: UIImage(systemName: "flag"), tag: 1)
        leagueViewController.tabBarItem = leagueBarItem
        
        // ProfileViewController
        let profileViewController = UIStoryboard(name: "ProfileViewController", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        let profileBarItem = UITabBarItem(title: NSLocalizedString("TabBarViewController.profile", comment: ""), image: UIImage(systemName: "person"), tag: 2)
        profileViewController.tabBarItem = profileBarItem
        

        let kids: [UIViewController] = [leagueViewController,homeViewController, profileViewController]
        
        
        setViewControllers(kids, animated: true)
        
    }
}
