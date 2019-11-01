//
//  NetworkSirvice.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 27.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Moya

enum NetworkSirvice {
    case getBanks
}

extension NetworkSirvice: TargetType {
    public var baseURL: URL {
        let url = URL(string: Localizable.url())
        return url!
    }
    
    public var path: String {
        return ""
    }
    
    public var method: Method {
        .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
