//
//  BanksView.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class BanksView: UIView {
    
    let bankListArrey = [BankModel(id: "122", title: "Альфа-Банк", phone: "+1234567", branch: true, oldId: 22),
    BankModel(id: "33", title: "ВТБ Банк", phone: "444224", branch: false, oldId: 44)]
    let bankTableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        bankTableView.delegate = self
        bankTableView.dataSource = self
        setTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setTableView() {
        addSubview(bankTableView)
        bankTableView.backgroundColor = .white
        bankTableView.rowHeight = 200
        bankTableView.register(BanksTableViewCell.self, forCellReuseIdentifier: "Cell")
        bankTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension BanksView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bankListArrey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BanksTableViewCell(bank: bankListArrey[indexPath.row])
        return cell
    }
}
