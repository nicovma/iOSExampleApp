//
//  TabBarViewController.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 29/08/2022.
//

import UIKit;

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // HomeViewController
        let homeViewController = UIStoryboard(name: "HomeViewController", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0);
        // Add notification
        //hvc.tabBarItem.badgeValue = "3";
        
        
        // ProfileViewController
        let profileViewController = UIStoryboard(name: "ProfileViewController", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        profileViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1);

        let kids: [UIViewController] = [homeViewController, profileViewController]
        
        
        setViewControllers(kids, animated: true);
    }
}
