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
 
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewController = TutorialVC()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        window?.rootViewController = UserDefaults.isFirstLaunch() ? TutorialVC() : UINavigationController(rootViewController: BanksVC())
        NetworkReachabilityManager.shared.beginReachability()
        return true
    }
}

