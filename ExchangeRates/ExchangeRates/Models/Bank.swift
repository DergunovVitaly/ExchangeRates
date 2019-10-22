//
//  Bank.swift
//  ExchangeRates
//
//  Created by Mac on 06/10/2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Foundation

struct BankModel: Codable {
    let id: String
    let title: String
    let phone: String
    let branch: Bool
    let oldId: Int
    let logo: String
    let city: String
    var adress: String
}
