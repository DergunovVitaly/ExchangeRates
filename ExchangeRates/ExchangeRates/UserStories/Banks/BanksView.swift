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
    let bankListArrey = [BankModel(id: "122", title: "Альфа-Банк", phone: "044 93 81615 ", branch: true, oldId: 22, logo: "alfa", city: "Закарпатська облаcть Ужгород", adress: "Минайська, 70"),
                         BankModel(id: "33", title: "ВТБ Банк", phone: "044 93 81615 ", branch: false, oldId: 44, logo: "vtb", city: "Закарпатська облаcть Ужгород", adress: "Швабська, 45"),
                         BankModel(id: "21", title: "ПриватБанк", phone: "044 93 81615 ", branch: true, oldId: 33, logo: "privat", city: "Харьковская Область Харьков", adress: "Баварская 4а")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bankTableView.delegate = self
        bankTableView.dataSource = self
        setTableView()
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTableView() {
        addSubview(bankTableView)
        bankTableView.allowsSelection = false
        bankTableView.showsVerticalScrollIndicator = false
        bankTableView.backgroundColor = backgroundColor
        bankTableView.rowHeight = 200
        bankTableView.register(BanksTableViewCell.self, forCellReuseIdentifier: "Cell")
        bankTableView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(68)
            make.bottom.equalToSuperview()
        }
    }
    
    func setView() {
        backgroundColor = R.color.grayView()
    }
}

extension BanksView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        bankListArrey.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BanksTableViewCell(bank: bankListArrey[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
