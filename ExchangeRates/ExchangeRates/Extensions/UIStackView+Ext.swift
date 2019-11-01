//
//  UIStackView+Ext.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 01.11.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
