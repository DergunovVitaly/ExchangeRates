//
//  BanksVC.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//
import UIKit
import Moya

class BanksVC: UIViewController {
    
    var bankListArray = [BankModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Localizable.titleNameFirstView()
        setNavigationController()
       
            Request.fetch { (bank) in
                let contentView = BanksView(bankArray: bank)
                    contentView.delegate = self
                self.view = contentView
            }
    }
    
    func setNavigationController() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.barTintColor = R.color.lightBlue()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButton))
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func searchButton() {
        print("work")
    }
}


extension BanksVC: BanksViewDelegate {
    func linkButtonAction() {
        
    }
    
    func locationButtonAction() {
        
    }
    
    func phoneButtonAction() {
        
    }
    
    func detailButtonAction() {
        navigationController?.pushViewController(DetailBankVC(), animated: true)
    }
}


