//
//  BanksView.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit


class BanksView: UIView {
    
    let bankTableView = UITableView()
    let bankListArrey = [BankModel(id: "122", title: "Альфа-Банк", phone: "044 93 81615 ", branch: true, oldId: 22, logo: "alfa", cities: "Ужгород", address: "Минайська, 70", regions: "Закарпатська облаcть "),
                         BankModel(id: "33", title: "ВТБ Банк", phone: "044 93 81615 ", branch: false, oldId: 44, logo: "vtb", cities: "Ужгород", address: "Швабська, 45", regions: "Закарпатська облаcть "),
                         BankModel(id: "21", title: "ПриватБанк", phone: "044 93 81615 ", branch: true, oldId: 33, logo: "privat", cities: "Харьков", address: "Баварская 4а", regions: "Харьковская Область ")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bankTableView.delegate = self
        bankTableView.dataSource = self
        setTableView()
        backgroundColor = R.color.grayView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTableView() {
        addSubview(bankTableView)
        bankTableView.separatorStyle = .none
        bankTableView.allowsSelection = false
        bankTableView.showsVerticalScrollIndicator = false
        bankTableView.backgroundColor = backgroundColor
        bankTableView.rowHeight = 200
        bankTableView.register(BanksTableViewCell.self, forCellReuseIdentifier: "Cell")
        bankTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(68)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension BanksView: UITableViewDelegate, UITableViewDataSource, BanksTableViewCellDelegate {
    func linkButtonAction() {
        
    }
    
    func locationButtonAction() {
        
    }
    
    func phoneButtonAction() {
        
    }
    
    func menuButtonAction() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bankListArrey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BanksTableViewCell(bank: bankListArrey[indexPath.row])
        return cell
    }
}
