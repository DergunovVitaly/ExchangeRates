//
//  BankModel.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 27.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Foundation

struct Bank: Codable {
      var id: String?
      var oldId: Int?
      var branch: Bool?
      var title: String?
      var regionId: String?
      var cityId: String?
      var phone: String?
      var address: String?
      var link: String?
      var regionName: String?
      var cityName: String?
      var currencies: [String : Currency]?
  }
struct Currency: Codable {
      var bid: String?
      var ask: String?
}
