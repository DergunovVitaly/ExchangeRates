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
    
    class func fetch(complition: @escaping ([Bank]) -> ()) {
        let provider = MoyaProvider<NetworkSirvice>()
        provider.request(.getBanks) { result in
            switch result {
            case .success(let response):
                print(response.data)
                
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
}
