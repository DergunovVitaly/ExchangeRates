//
//  BanksView.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import UIKit

protocol BanksViewDelegate: class {
    func linkButtonAction()
    func locationButtonAction()
    func phoneButtonAction()
    func detailButtonAction()
}

class BanksView: UIView {
    
    weak var delegate: BanksViewDelegate?
    
    let bankTableView = UITableView()
    let navigationControlExemp = UINavigationController()
    var bankModelArray : [Organization]?

    override init(frame: CGRect) {
        super.init(frame: .zero)
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
        bankTableView.register(BankTableViewCell.self, forCellReuseIdentifier: "Cell")
        bankTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(68)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension BanksView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankModelArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BankTableViewCell()
        let bankIndexPath = bankModelArray![indexPath.row]
        cell.updateBankModel(bankModel: bankIndexPath)
        cell.delegate = self
        return cell
    }
}

extension BanksView: BanksTableViewCellDelegate {
    func linkButtonAction() {
        delegate?.linkButtonAction()
    }
    
    func locationButtonAction() {
        delegate?.locationButtonAction()
    }
    
    func phoneButtonAction() {
        delegate?.phoneButtonAction()
    }
    
    func detailButtonAction() {
        delegate?.detailButtonAction()
    }
}
