//
//  Request.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 27.10.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation
import Moya

class Request {
    
    static func fetch(completion: @escaping (Result<BankModel, Error>) -> ()) {
        
        let provider = MoyaProvider<NetworkSirvice>()
        provider.request(.getBanks) { result in
            switch result {
            case .success(let response):
                response.statusCode == 200 ? print("✈️") : print(response.statusCode)
                do {
                    let bank = try response.map(BankModel.self)
                    completion(.success(bank))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                AlertViewController.showAlertView(title: "Увага", subTitle: "увага", style: .warning, closeButtonTitle: "Гаразд")
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
}
