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
    func detailButtonActionDidSelectRow(indexPath: IndexPath)
}

class BanksView: UIView {
    
    weak var delegate: BanksViewDelegate?
    
    let bankTableView = UITableView()
    var viewModel: [BankViewModel] = []
    private let searchController = UISearchController(searchResultsController: nil)
    
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
    
    func update(viewModel: [BankViewModel]) {
        self.viewModel = viewModel
    }
    
    private func setupTableView() {
        backgroundColor = .white
        
        addSubview(bankTableView)
        bankTableView.separatorStyle = .none
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
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.detailButtonActionDidSelectRow(indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = bankTableView.dequeueReusableCell(withIdentifier: String(describing: BankTableViewCell.self)) as? BankTableViewCell else { return UITableViewCell() }
        cell.urlForImageBankLogo = viewModel[indexPath.row].urlBankLogo
        cell.update(organizations: viewModel[indexPath.row].organization, regionsName: viewModel[indexPath.row].regionName, cityName: viewModel[indexPath.row].cityName, urlForImageBankLogo: viewModel[indexPath.row].urlBankLogo)
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
