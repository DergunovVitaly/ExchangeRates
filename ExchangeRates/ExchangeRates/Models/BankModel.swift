//
//  BankModel.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 27.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Foundation

struct Organization: Codable {
    let id: String
    let oldID: Int
    let orgType: Int
    let branch: Bool
    let title: String
    let regionID: String
    let cityID: String
    let phone: String
    let address: String
    let link: String
    let currencies: [String: Currency]
}

struct Currency: Codable {
    var bid: String?
    var ask: String?
}
