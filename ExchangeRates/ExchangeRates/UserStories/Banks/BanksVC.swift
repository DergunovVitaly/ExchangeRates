//
//  BanksVC.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//
import UIKit

class BanksVC: UIViewController {
    
    let bankListArrey = [BankModel(id: "122", title: "Альфа-Банк", phone: "044 93 81615 ", branch: true, oldId: 22, logo: "alfa", cities: "Ужгород", address: "Минайська, 70", regions: "Закарпатська облаcть "),
                            BankModel(id: "33", title: "ВТБ Банк", phone: "044 93 81615 ", branch: false, oldId: 44, logo: "vtb", cities: "Ужгород", address: "Швабська, 45", regions: "Закарпатська облаcть "),
                            BankModel(id: "21", title: "ПриватБанк", phone: "044 93 81615 ", branch: true, oldId: 33, logo: "privat", cities: "Харьков", address: "Баварская 4а", regions: "Харьковская Область ")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Localizable.titleNameFirstView()
        view = BanksView(frame: .zero, arrayList: bankListArrey)
        let cell = BanksTableViewCell()
        for i in 0..<bankListArrey.count {
        cell.updateBankModel(bankModel: bankListArrey[i])
        }
    }
}

