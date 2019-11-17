//
//  AppDelegate.swift
//  ExchangeRates
//
//  Created by Vitalii Derhunov on 05.10.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import UIKit
import SnapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var optionallyStoreTheFirstLaunchFlag = false
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewController = TutorialVC()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        optionallyStoreTheFirstLaunchFlag = UserDefaults.isFirstLaunch()
        let firstLaunch = optionallyStoreTheFirstLaunchFlag
        if firstLaunch {
            window?.rootViewController = TutorialVC()
        } else {
            let navigation = UINavigationController(rootViewController: BanksVC())
            window?.rootViewController = navigation
        }
        return true
    }
}

