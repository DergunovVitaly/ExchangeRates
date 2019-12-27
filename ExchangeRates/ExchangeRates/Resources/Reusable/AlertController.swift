//
//  AlertController.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 23.11.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation
import SCLAlertView

class AlertViewController {
    
    static func showAlertView(title: String, subTitle: String, style: SCLAlertViewStyle, closeButtonTitle: String) {
        let alertView = SCLAlertView()
        alertView.showTitle(title, subTitle: subTitle, style: style, closeButtonTitle: closeButtonTitle, colorStyle: 0x4A90E2, colorTextButton: 0x000000, animationStyle: .noAnimation)
    }
    
    static func showErrorAlertView() {
        let alertView = SCLAlertView()
        alertView.showTitle(Localizable.alertWarring(), subTitle: Localizable.error(), style: .warning, closeButtonTitle: Localizable.alertGarazd(), colorStyle: 0x4A90E2, colorTextButton: 0x000000, animationStyle: .noAnimation)
    }
}
