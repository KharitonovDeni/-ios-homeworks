//
//  PostViewController.swift
//  Navigation
//
//  Created by Denis on 05.01.2023.
//

import UIKit

final class PostViewController: UIViewController {

    // MARK: - Properties
    var postTitle: String!
    private lazy var postView = PostView()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = postView
        view.backgroundColor = .systemGray5
        title = postTitle
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .systemGray3
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "VKcolor") ?? UIColor.systemCyan]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(goToInfo))]
        navigationController?.navigationBar.tintColor = UIColor(named: "VKcolor")
    }
    
    @objc private func goToInfo() {
        let infoVC = InfoViewController()
        infoVC.hidesBottomBarWhenPushed = true
        navigationController?.present(infoVC, animated: true)
    }
}
