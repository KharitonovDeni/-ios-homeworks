//
//  InfoView.swift
//  Navigation
//
//  Created by Denis on 15.01.2023.
//

import UIKit

final class InfoView: UIView {
    
    lazy var showAlertButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = UIColor(named: "VKcolor")
        buttonConfiguration.title = "Show Alert"
        let button = UIButton(configuration: buttonConfiguration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = .systemRed
        buttonConfiguration.title = "Cancel"
        let button = UIButton(configuration: buttonConfiguration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray5
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        
        addSubview(showAlertButton)
        addSubview(cancelButton)
        
        NSLayoutConstraint.activate([
            showAlertButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -120),
            showAlertButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            showAlertButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: showAlertButton.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
}
