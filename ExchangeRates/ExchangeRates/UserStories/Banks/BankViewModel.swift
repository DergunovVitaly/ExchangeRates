//
//  BankViewModel.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 23.11.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation

class BankViewModel {
    
    var organization: [Organization]?
    var regionName: [String]?
    var cityName: [String]?
    var urlBankLogo: [String]?
    
    init(organization: [Organization], regionName: [String], cityName: [String], urlBankLogo: [String]) {
        self.organization = organization
        self.regionName = regionName
        self.cityName = cityName
        self.urlBankLogo = urlBankLogo
    }
}
