//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Denis on 05.01.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    private var profileHeader = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpActions()
        setupNavigationBar()
        self.view = profileHeader
    }
    
    private func setUpActions() {
        profileHeader.profileStatusButton.addTarget(self, action: #selector(profileStatusButtonTapped), for: .touchUpInside)
        setKeyboardSettings(forUITextField: profileHeader.profileStatusTextField)
        profileHeader.profileStatusTextField.addTarget(self, action: #selector(profileStatusTextChanged), for: .editingChanged)
    }

    private func showAlert(withTitle title: String, andMessage message: String) {
        guard let rootVC = view.window?.rootViewController else { return }
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("This is Ok Action")
        }

        alert.addAction(okAction)
        rootVC.present(alert, animated: true)
    }
    
    private func setupNavigationBar() {
        title = "Profile"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .darkGray

        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc private func profileStatusButtonTapped() {
        profileHeader.profileStatusLabel.text = profileHeader.statusText
        profileHeader.profileStatusTextField.text = .none
        profileHeader.profileStatusTextField.resignFirstResponder()
    }

    @objc private func profileStatusTextChanged(_ textField: UITextField) {
        guard let status = textField.text, status.count <= 90 else {
            while textField.text?.count != 89 {
                textField.text?.removeLast()
            }
            showAlert(withTitle: "Oops!", andMessage:  "You can input maximum 90 symbols!")
            return
        }
        profileHeader.statusText = status
        profileHeader.profileStatusTextField.becomeFirstResponder()
    }

}

extension ProfileViewController: UITextFieldDelegate {
    private func setKeyboardSettings(forUITextField textfield: UITextField) {
        textfield.delegate = self
        textfield.keyboardAppearance = .dark
        textfield.autocorrectionType = .no
        textfield.returnKeyType = .done
        textfield.enablesReturnKeyAutomatically = true
        textfield.clearButtonMode = .always
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        profileHeader.addGestureRecognizer(tapOnView)
    }

    @objc func dismissKeyboard() {
        profileHeader.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        profileHeader.profileStatusLabel.text = textField.text
        textField.text = .none
        textField.resignFirstResponder()
        return true
    }
}
