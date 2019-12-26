//
//  ExchangeRatesCustomFunc.swift
//  ExchangeRates
//
//  Created by Mac on 08.11.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import UIKit
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
        array.map { "https://static.finance.ua/img/ext/org-logo/88/\($0).png" }
    }
   
    static func getStringfromAn(int: Int) -> String {
        "https://static.finance.ua/img/ext/org-logo/88/\(String(int)).png"
    }
}

