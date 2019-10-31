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
    
    private let contentView = BanksView()
    var bankListArray = [Organization]()
    
    override func loadView() {
        super.loadView()
        contentView.delegate = self
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Localizable.titleNameFirstView()
        setNavigationController()
    
            Request.fetch { (bank) in
                let organization = bank[0].organizations
                self.contentView.bankModelArray = organization
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


