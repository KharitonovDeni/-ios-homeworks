
//  ProfileViewController.swift
//  Navigation
//
//  Created by Denis on 21.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let posts = Post.getDefaultPosts()
    private lazy var profileHeaderView = ProfileHeaderView()
    private lazy var profileView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        self.view = profileView
        view.backgroundColor = .systemGray3
        profileView.tableView.dataSource = self
        profileView.tableView.delegate = self
    }

    func setupNavigationBar() {
        title = "Profile"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .systemGray6
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "VKColor") ?? UIColor.systemCyan]
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = UIColor(named: "VKColor")
    }
    
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.setupCell(with: post)
        return cell
    }
}
