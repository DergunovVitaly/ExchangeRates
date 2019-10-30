//
//  Request.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 27.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

class Request {
    
    class func fetch(complition: @escaping ([BankModel]) -> ()) {
        
        var bankArray = [BankModel]()
        
        let provider = MoyaProvider<NetworkSirvice>()
        provider.request(.getBanks) { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                let data = response.data
                guard let bank = try? decoder.decode(BankModel.self, from: data) else { return }
                bankArray.append(bank)
                complition(bankArray)
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
}
