//
//  TabBar.swift
//  Navigation
//
//  Created by Darya Zhitova on 28.01.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    func makeTabBarController() -> UITabBarController {
        let feedVC = FeedViewController()
        let logInVC = LogInViewController()

        let feedNavBarVC = UINavigationController(rootViewController: feedVC)
        let logInNavBarVC = UINavigationController(rootViewController: logInVC)
        logInNavBarVC.navigationBar.isHidden = true

        setSettings(forViewControllers: feedVC, logInVC)

        let rootTabBarController = UITabBarController()
        rootTabBarController.viewControllers = [feedNavBarVC, logInNavBarVC]

        setSettings(forTabBarController: rootTabBarController)

        return rootTabBarController
    }
    
    private func setSettings(forTabBarController tabBarController: UITabBarController) {
        tabBarController.tabBar.backgroundColor = .systemGray3
        tabBarController.tabBar.unselectedItemTintColor = .systemGray
        tabBarController.tabBar.tintColor = UIColor(named: "VKColor")
        tabBarController.tabBar.barTintColor = .systemGray3
        tabBarController.tabBar.barStyle = .default
    }
    
    private func setSettings(forViewControllers viewControllers: UIViewController...) {
        viewControllers.forEach { viewController in
            if viewController is LogInViewController {
                viewController.tabBarItem.image = UIImage(systemName: "person.circle")
                viewController.tabBarItem.title = "Profile"
            } else if viewController is FeedViewController {
                viewController.tabBarItem.image = UIImage(systemName: "list.bullet.circle")
                viewController.tabBarItem.title = "Feed"
            }
        }
    }
}
