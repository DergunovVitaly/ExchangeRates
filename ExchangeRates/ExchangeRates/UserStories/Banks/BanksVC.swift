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

extension BanksVC: BanksTableViewCellDelegate {
    func linkButtonAction() {
        self.present(UINavigationController(rootViewController: LinkView()), animated: true, completion: nil)
    }
    
    func locationButtonAction() {
        self.present(UINavigationController(rootViewController: LocationView()), animated: true, completion: nil)
    }
    
    func phoneButtonAction() {
        self.present(UINavigationController(rootViewController: PhoneView()), animated: true, completion: nil)
    }
    
    func menuButtonAction() {
        self.present(UINavigationController(rootViewController: MenuView()), animated: true, completion: nil)
    }
    
    
}
