//
//  String+Ext.swift
//  ExchangeRates
//
//  Created by Mac on 12.11.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//
import UIKit
import Foundation

extension String {
    
    func deleteLastLettersAfter(character: Character) -> String {
        return String(self[..<(self.lastIndex(of: character) ?? self.endIndex)])
    }
    
    func add(prefix: String) -> String {
        return prefix + self
    }
    
    func add(postfix: String) -> String {
        return self + postfix
    }
    
    func attributedStringForPartiallyColoredText(_ textToFind: String, with color: UIColor) -> NSMutableAttributedString {
        let mutableAttributedstring = NSMutableAttributedString(string: self)
        let range = mutableAttributedstring.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range.location != NSNotFound {
            mutableAttributedstring.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        return mutableAttributedstring
    }
}
