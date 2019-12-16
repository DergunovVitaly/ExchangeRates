//
//  UIScreen+Ext.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 16.12.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation
import UIKit

public enum ScreenSizes: CGFloat {
    case undefined
    case iphone4 = 480
    case iphone5 = 568
    case iphone6 = 667
    case iphonePlus = 736
    case iphoneX = 812
    case iphonexrsmax = 896
    case ipad = 1024
}

public extension UIScreen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    
    static var screenType: ScreenSizes {
        if let size = ScreenSizes(rawValue: maxScreenLength()) {
            return size
        }
        return .undefined
    }
    
    private static func maxScreenLength() -> CGFloat {
        let bounds = UIScreen.main.bounds
        return max(bounds.width, bounds.height)
    }
}
