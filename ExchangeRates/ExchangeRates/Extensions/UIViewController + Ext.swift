//
//  UIViewController + Ext.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 19.12.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setApperanceForNavBar() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = R.color.lightBlue()
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
            navigationController?.navigationBar.tintColor = .white
        }
    }
}
