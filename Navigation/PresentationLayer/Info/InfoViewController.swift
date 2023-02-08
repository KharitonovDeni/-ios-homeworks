//
//  InfoViewController.swift
//  Navigation
//
//  Created by Denis on 05.01.2023.
//

import UIKit

final class InfoViewController: UIViewController {
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("This is Ok Action")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            print("This is Cancel Action")
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
}
