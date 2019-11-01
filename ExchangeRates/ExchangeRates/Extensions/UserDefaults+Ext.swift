//
//  UserDefaults+Ext.swift
//  ExchangeRates
//
//  Created by Mac on 01.11.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Foundation

extension UserDefaults {
    static func isFirstLaunch() -> Bool {
        let hasBeenLaunchedBeforeFlag = "hasBeenLaunchedBeforeFlag"
        let isFirstLaunch = !UserDefaults.standard.bool(forKey: hasBeenLaunchedBeforeFlag)
        if (isFirstLaunch) {
            UserDefaults.standard.set(true, forKey: hasBeenLaunchedBeforeFlag)
            UserDefaults.standard.synchronize()
        }
        return isFirstLaunch
    }
}
