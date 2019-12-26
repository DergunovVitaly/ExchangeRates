//
//  UILabel+Ext.swift
//  ExchangeRates
//
//  Created by Mac on 20.11.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import UIKit
import Foundation

extension UILabel {
    
    func addPrefixWithSpecialColorOnLabel(text: String, prefix: String) {
        self.attributedText = text.add(prefix: prefix).attributedStringForPartiallyColoredText(prefix, with: R.color.lightGrey() ?? UIColor())
    }
}
