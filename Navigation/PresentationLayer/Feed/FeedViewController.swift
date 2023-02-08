//
//  FeedViewController.swift
//  Navigation
//
//  Created by Denis on 05.01.2023.
//

import UIKit

final class FeedViewController: UIViewController {

    private lazy var feedView = FeedView()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = feedView
        setupNavigationBar()
        view.backgroundColor = .systemGray5
    }
    
    private func setupNavigationBar() {
        title = "Feed"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .systemGray3
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "VKcolor") ?? UIColor.systemCyan]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = UIColor(named: "VKcolor")
    }
    
    private func goToPost() {
        let postVC = PostViewController()
        postVC.postTitle = "Post"
        postVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(postVC, animated: true)
    }
}
