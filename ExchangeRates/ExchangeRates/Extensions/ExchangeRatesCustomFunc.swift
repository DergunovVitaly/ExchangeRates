//
//  ExchangeRatesCustomFunc.swift
//  ExchangeRates
//
//  Created by Mac on 08.11.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation

class ExchangeRatesCustomFunc {
    
    static func compareArrayWithDictionaryKeys(keyArray: [String], dict: [String : String]) -> [String] {
        var resultArray = [String]()
        for item in 0..<keyArray.count {
            resultArray.append(dict[keyArray[item]]!)
        }
        return resultArray
    }
    
    static func gettingStringsArrayFromAn(array: [Int]) -> [String] {
        
        var resultArray = [String]()
        for i in 0..<array.count {
            resultArray.append("https://static.finance.ua/img/ext/org-logo/88/\(String(array[i])).png")
        }
        return resultArray
    }
    
    static func addPrefixAt(string: String) -> String {
        var result = string
        return ""
    }
}

