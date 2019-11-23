//
//  NetworkManager.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 21.11.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation
import Reachability
import SCLAlertView

class NetworkReachabilityManager {
    
    let reachability: Reachability?
    
    static var shared = NetworkReachabilityManager()
    
    private init() {
        self.reachability = try? Reachability()
    }
    
    deinit {
        stopReachability()
    }
    
    func showAlertView() {
        let alertView = SCLAlertView()
        alertView.showTitle(Localizable.alertWarring(), subTitle: Localizable.alertNoCoonection(), style: .warning, closeButtonTitle: Localizable.alertGarazd(), colorStyle: 0x4A90E2, colorTextButton: 0x000000, animationStyle: .noAnimation)
    }
    
    func beginReachability() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reachabilityChanged),
                                               name: .reachabilityChanged,
                                               object: reachability)
        do {
            try reachability?.startNotifier()
        } catch {
            debugPrint("could not start reachability notifier")
        }
    }
    
    func stopReachability() {
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }
    
    func rebootReachability() {
        stopReachability()
        beginReachability()
    }
    
    @objc func reachabilityChanged(note: Notification) {
        guard let reachability = note.object as? Reachability
            else { rebootReachability(); return }
        
        switch reachability.connection {
        case .wifi:
            debugPrint("Reachable via WiFi")
        case .cellular:
            debugPrint("Reachable via Cellular")
        case .none:
            debugPrint("Network not reachable")
        case .unavailable:
            showAlertView()
            debugPrint("Network is unavailable")
        }
    }
}
