//
//  BanksView.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import UIKit

protocol BanksViewDelegate: class {
    func linkButtonAction(cell: BankTableViewCell)
    func locationButtonAction()
    func phoneButtonAction()
    func detailButtonAction(cell: BankTableViewCell)
    func detailButtonActionDidSelectRow(indexPath: IndexPath)
}

class BanksView: UIView {
    
    weak var delegate: BanksViewDelegate?
    
    let bankTableView = UITableView()
    private(set) var organizationsArray: [Organization] = []
    private(set) var regionNamesArray = [String]()
    private(set) var cityNamesArray = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        bankTableView.delegate = self
        bankTableView.dataSource = self
        setupTableView()
        backgroundColor = R.color.grayView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(organizations: [Organization], regionName: [String], cityName: [String]) {
        self.organizationsArray = organizations
        self.regionNamesArray = regionName
        self.cityNamesArray = cityName
    }
    
    private func setupTableView() {
        addSubview(bankTableView)
        bankTableView.separatorStyle = .none
        bankTableView.showsVerticalScrollIndicator = false
        bankTableView.backgroundColor = backgroundColor
        bankTableView.rowHeight = 200
//        bankTableView.allowsSelection = false
//        bankTableView.allowsSelectionDuringEditing = false
        bankTableView.register(BankTableViewCell.self, forCellReuseIdentifier: String(describing: BankTableViewCell.self))
        bankTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(68)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension BanksView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizationsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BankTableViewCell(organizations: organizationsArray[indexPath.row],
                                     regionsName: regionNamesArray[indexPath.row],
                                     cityName: cityNamesArray[indexPath.row], urlForBankLogo: "https://static.finance.ua/img/ext/org-logo/88/\(String(organizationsArray[indexPath.row].oldId)).png")
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.detailButtonActionDidSelectRow(indexPath: indexPath)
        bankTableView.reloadData()
    }
}

extension BanksView: BanksTableViewCellDelegate {
    
    func detailButtonAction(cell: BankTableViewCell) {
        self.delegate?.detailButtonAction(cell: cell)
    }
    
    func linkButtonAction(cell: BankTableViewCell) {
        self.delegate?.linkButtonAction(cell: cell)
    }
    
    func locationButtonAction() {
        self.delegate?.locationButtonAction()
    }
    
    func phoneButtonAction() {
        self.delegate?.phoneButtonAction()
    }
}
