//
//  BankViewModel.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 23.11.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation

class BankViewModel {
    
    let organization: Organization
    let regionName: String
    let cityName: String
    let urlBankLogo: String
    
    init(organization: Organization, regionName: String, cityName: String, urlBankLogo: String) {
        self.organization = organization
        self.regionName = regionName
        self.cityName = cityName
        self.urlBankLogo = urlBankLogo
    }
}
