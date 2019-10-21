//
//  BanksTableViewCell.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class BanksTableViewCell: UITableViewCell {
    
    let bank: BankModel
    let bankLabel = UILabel()
    
    init(bank: BankModel) {
        self.bank = bank
        super.init(style: .default, reuseIdentifier: "Cell")
        setTableView()
      }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTableView() {
        addSubview(bankLabel)
        bankLabel.text = bank.title
        bankLabel.font = R.font.helveticaNeue(size: 26)
        bankLabel.textColor = R.color.lightDark()
        bankLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
        }
    }    
}
