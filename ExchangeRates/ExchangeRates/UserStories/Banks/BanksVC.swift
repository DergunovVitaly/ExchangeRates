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
    
    let bankListArray = [BankModel(id: "122", title: "Альфа-Банк", phone: "044 93 81615 ", branch: true, oldId: 22, logo: "alfa", cities: "Ужгород", address: "Минайська, 70", regions: "Закарпатська облаcть "),
                         BankModel(id: "33", title: "ВТБ Банк", phone: "044 93 81615 ", branch: false, oldId: 44, logo: "vtb", cities: "Ужгород", address: "Швабська, 45", regions: "Закарпатська облаcть "),
                         BankModel(id: "21", title: "ПриватБанк", phone: "044 93 81615 ", branch: true, oldId: 33, logo: "privat", cities: "Харьков", address: "Баварская 4а", regions: "Харьковская Область ")]
    var banksArray = [Organization]()
    
    let provider = MoyaProvider<NetworkSirvice>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Localizable.titleNameFirstView()
        let contentView = BanksView(arrayList: bankListArray)
        contentView.delegate = self
        view = contentView
        setNavigationController()
        DispatchQueue.main.async {
            self.provider.request(.getBanks) { result in
                switch result {
                case .success(let response):
                    let data = response.data
                    let json = try? response.mapJSON()
                    print(json)
                case .failure(let error):
                    print(error.errorDescription ?? "Unknown error")
                }
            }
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


