//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Denis on 14.01.2023.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    var statusText: String?

    lazy var profileImageView: UIImageView = {
        let profileImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 132, height: 132))
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.contentMode = .scaleAspectFit
        profileImage.clipsToBounds = true
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 3
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.image = UIImage(systemName: "person.crop.circle.fill")
        profileImage.tintColor = .white
        return profileImage
    }()

    lazy var profileTitleLabel: UILabel = {
        let profileLabel = UILabel()
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.font = .systemFont(ofSize: 18, weight: .bold)
        profileLabel.text = "Foo Bar"
        profileLabel.textColor = .black
        return profileLabel
    }()

    lazy var profileStatusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.text = "*args and **kwargs..."
        statusLabel.numberOfLines = 0
        statusLabel.textColor = .gray
        return statusLabel
    }()

    lazy var profileStatusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.setTitle("Setup Status", for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        return statusButton
    }()

    lazy var profileStatusTextField: UITextField = {
        let statusTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.font = .systemFont(ofSize: 15, weight: .regular)
        statusTextField.layer.masksToBounds = true
        statusTextField.placeholder = "Input your status"
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        return statusTextField
    }()
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .lightGray
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        
        addSubview(profileImageView)
        addSubview(profileTitleLabel)
        addSubview(profileStatusButton)
        addSubview(profileStatusLabel)
        addSubview(profileStatusTextField)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 132),
            profileImageView.heightAnchor.constraint(equalToConstant: 132),

            profileTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            profileTitleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            profileTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            profileStatusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            profileStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            profileStatusLabel.bottomAnchor.constraint(equalTo: profileStatusButton.topAnchor, constant: -54),
            profileStatusLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            profileStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            profileStatusTextField.topAnchor.constraint(equalTo: profileStatusLabel.bottomAnchor, constant: 10),
            profileStatusTextField.bottomAnchor.constraint(equalTo: profileStatusButton.topAnchor, constant: -10),
            profileStatusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileStatusTextField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
        ])
    }
}

