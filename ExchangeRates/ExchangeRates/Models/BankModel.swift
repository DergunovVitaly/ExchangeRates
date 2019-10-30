//
//  BankModel.swift
//  ExchangeRates
//
//  Created by Mac on 06/10/2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Foundation

struct BankModel: Codable {
    let organizations: [Organization]?
}

struct Organization: Codable {
    let id: String?
    let oldId, orgType: Int?
    let branch: Bool?
    let title, regionId, cityId, phone: String?
    let address: String?
    let link: String?
    let currencies: [String: Currency]?
}

struct Currency: Codable {
    let ask, bid: String?
}
