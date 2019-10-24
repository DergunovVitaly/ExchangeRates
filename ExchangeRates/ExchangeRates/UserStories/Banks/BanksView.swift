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
    private var arrayList : [BankModel]
    
     init(frame: CGRect, arrayList: [BankModel]) {
        self.arrayList = arrayList
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
        arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BanksTableViewCell()
        return cell
    }
}
