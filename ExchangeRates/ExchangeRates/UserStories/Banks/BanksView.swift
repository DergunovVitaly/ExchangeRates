//
//  BanksView.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import UIKit

protocol BanksViewDelegate: class {
    func linkButtonAction(cell: BankTableViewCell)
    func locationButtonAction()
    func phoneButtonAction()
    func detailButtonAction(cell: BankTableViewCell)
}

class BanksView: UIView {
    
    weak var delegate: BanksViewDelegate?
    
    let bankTableView = UITableView()
    var vm: [BankViewModel] = []
//    private(set) var organizationsArray: [Organization] = []
//    private(set) var regionNamesArray = [String]()
//    private(set) var cityNamesArray = [String]()
//    private(set) var urlForImageBankLogoArray = [String]()
    
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
    
    func update(vm: [BankViewModel]) {
        self.vm = vm
//        self.organizationsArray = vm.organization
//        self.regionNamesArray = vm.regionName
//        self.cityNamesArray = vm.cityName
//        self.urlForImageBankLogoArray = vm.urlBankLogo
    }
    
    private func setupTableView() {
        backgroundColor = .white
        
        addSubview(bankTableView)
        bankTableView.separatorStyle = .none
        bankTableView.allowsSelection = false
        bankTableView.showsVerticalScrollIndicator = false
        bankTableView.backgroundColor = .white
        bankTableView.register(BankTableViewCell.self, forCellReuseIdentifier: String(describing: BankTableViewCell.self))
        bankTableView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}

extension BanksView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BankTableViewCell(organizations: vm[indexPath.row].organization, regionsName: vm[indexPath.row].regionName, cityName: vm[indexPath.row].cityName, urlForImageBankLogo: vm[indexPath.row].urlBankLogo)
        cell.delegate = self
        return cell
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
