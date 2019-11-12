//
//  String+Ext.swift
//  ExchangeRates
//
//  Created by Mac on 12.11.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Foundation

extension String {
    func deleteLastLettersAfter(character: Character) -> String {
         return String(self[..<(self.lastIndex(of: character) ?? self.endIndex)])
     }
}
