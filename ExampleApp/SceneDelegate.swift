//
//  SceneDelegate.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 27/08/2022.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let user = Auth.auth().currentUser
        
        guard let winScene = (scene as? UIWindowScene) else { return }
        let win = UIWindow(windowScene: winScene)
        
        var storyboard : UIStoryboard
        var initialViewController: UIViewController
        
        if user?.uid == nil {
            storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
            initialViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        } else {
            initialViewController = TabBarViewController()
        }
        let nc = UINavigationController(rootViewController: initialViewController)
        nc.navigationBar.isHidden = true
        win.rootViewController = nc
        win.makeKeyAndVisible()
        window = win
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func loginSuccess() {
        if let window = self.window {
            window.rootViewController = TabBarViewController()
        }
        
    }
    
    func logoutSuccess() {
        if let window = self.window {
            let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            window.rootViewController = initialViewController
        }
        
    }

}

