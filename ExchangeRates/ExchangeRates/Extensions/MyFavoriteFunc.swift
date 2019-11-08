//
//  MyFavoriteFunc.swift
//  ExchangeRates
//
//  Created by Mac on 08.11.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Foundation

class MyFavoriteFunc {
    
    static func compareArrayWithDictionaryKeys(keyArray: [String], dict: [String : String]) -> [String] {
        var resultArray = [String]()
        for item in 0..<keyArray.count {
            resultArray.append(dict[keyArray[item]]!)
        }
        return resultArray
    }
}
