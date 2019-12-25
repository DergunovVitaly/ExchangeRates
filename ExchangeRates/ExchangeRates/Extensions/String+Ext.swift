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
    
    func formatPhoneNumber() -> String {
        var string = self
        let start = string.startIndex
        string.insert(" ", at: string.index(start, offsetBy: 3))
        string.insert(" ", at: string.index(start, offsetBy: 6))
        string.insert(" ", at: string.index(start, offsetBy: 10))
        return string
    }
    
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }
    
    func isValid(regex: RegularExpressions) -> Bool { return isValid(regex: regex.rawValue) }
    func isValid(regex: String) -> Bool { return range(of: regex, options: .regularExpression) != nil }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
    
    func makeACall() {
        guard isValid(regex: .phone),
            let url = URL(string: "tel://\(self.onlyDigits())") else { return }
        UIApplication.shared.open(url)
    }
}
