//
//  UIView.swift
//  Navigation
//
//  Created by Denis on 15.01.2023.
//

import UIKit

extension UIView {
    func addSubviewsIn(_ view: UIView, _ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            addSubview(subview)
        }
    }
}

