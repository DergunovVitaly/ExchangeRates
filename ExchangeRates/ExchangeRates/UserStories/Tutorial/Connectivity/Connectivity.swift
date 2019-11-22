//
//  Connectivity.swift
//  ExchangeRates
//
//  Created by Mac on 22.11.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation
import Alamofire

struct Connectivity {
  static let sharedInstance = NetworkReachabilityManager()!
  static var isConnectedToInternet: Bool {
      return self.sharedInstance.isReachable
    }
}
