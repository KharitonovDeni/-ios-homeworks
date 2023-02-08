
//  ProfileViewController.swift
//  Navigation
//
//  Created by Denis on 21.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let posts = Post.getDefaultPosts()
    private lazy var profileView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .systemGray3
        profileView.tableView.dataSource = self
        profileView.tableView.delegate = self
        profileView.tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifier)
        profileView.tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        profileView.statusTextField.setKeyboardSettings(forUITextField: profileView.statusTextField)
        profileView.statusTextField.addTarget(self, action: #selector(profileStatusTextChanged), for: .editingChanged)
    }
    
    
    @objc private func profileChangeStatusButtonTapped() {
        print("New profile status \(profileView.statusText ?? "")")
        profileView.statusLabel.text = profileView.statusText ?? ""
        profileView.statusTextField.text = .none
        profileView.statusTextField.resignFirstResponder()
    }
    
    @objc private func profileStatusTextChanged(_ textField: UITextField) {
        guard let status = textField.text, status.count <= 90 else {
            while textField.text?.count != 89 {
                textField.text?.removeLast()
            }
            showAlert(withTitle: "Oops!", andMessage:  "You can input maximum 90 symbols!")
            return
        }
        profileView.statusText = status
        profileView.statusTextField.becomeFirstResponder()
    }

    func setupNavigationBar() {
        title = "Profile"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .systemGray3
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "VKColor") ?? UIColor.systemCyan]
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = UIColor(named: "VKColor")
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        guard let rootVC = profileView.window?.rootViewController else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("This is Ok Action")
        }
        
        alert.addAction(okAction)
        rootVC.present(alert, animated: true)
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


// MARK: - Keyboard
extension ProfileViewController: UITextFieldDelegate {
    private func setKeyboardSettings(forUITextField textField: UITextField) {
        textField.delegate = self
        textField.keyboardAppearance = .dark
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        textField.clearButtonMode = .always
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        addGestureRecognizer(tapOnView)
    }
    
    @objc func dismissKeyboard() {
        endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
}
