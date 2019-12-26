//
//  NetworkSirvice.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 27.10.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Moya

enum NetworkSirvice {
    case getBanks
}

extension NetworkSirvice: TargetType {
    public var baseURL: URL {
        let url = URL(string: "https://resources.finance.ua/")
        return url!
    }
    
    public var path: String {
        "ua/public/currency-cash.json"
    }
    
    public var method: Method {
        .get
    }
    
    public var sampleData: Data {
        Data()
    }
    
    public var task: Task {
        .requestPlain
    }
    
    public var headers: [String : String]? {
        ["Content-type": "application/json"]
    }
}
