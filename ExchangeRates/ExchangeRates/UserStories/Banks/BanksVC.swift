//
//  BanksVC.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//
import UIKit

class BanksVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Localizable.titleNameFirstView()
        view = BanksView()
    }
}

