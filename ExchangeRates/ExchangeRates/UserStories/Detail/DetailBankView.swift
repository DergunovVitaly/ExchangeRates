//
//  DetailView.swift
//  ExchangeRates
//
//  Created by Mac on 25.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Kingfisher
import UIKit

protocol BankViewDelegatDelegate: class {
    func detailButtonAction()
}

class DetailBankView: UIView {
    
    private var currencyArray: [Currency] = []
    private var currencyName: [String] = []
    private var urlBankLogo = String()
    private let currencyTableView = UITableView()
    private let headerView = UIView()
    private let currencyHeaderName = UILabel()
    private let purchaseSaleTitleHeaderLabel = UILabel()
    private let titleLabel = UILabel()
    private let bankLogo = UIImageView()
    private let detailButton = UIButton()
    private let contentBankScrollView = UIScrollView()
    private let linkBankLabel = UILabel()
    private let adressBankLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    
    weak var delegate: BankViewDelegatDelegate?
    
    init() {
        super.init(frame: .zero)
        currencyTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: String(describing: DetailTableViewCell.self))
        currencyTableView.delegate = self
        currencyTableView.dataSource = self
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getOrganizations(vm: BankViewModel) {
        self.titleLabel.text = vm.organization.title
        self.currencyArray = vm.organization.currencies.map { $0.value }
        self.currencyName = vm.organization.currencies.map { $0.key }
        self.linkBankLabel.addPrefixWithSpecialColorOnLabel(text: vm.organization.link.deleteLastLettersAfter(character: "/"), prefix: Localizable.link())
        self.phoneNumberLabel.addPrefixWithSpecialColorOnLabel(text: vm.organization.phone.formatPhoneNumber(), prefix: Localizable.titlePhoneLongNumber())
        self.adressBankLabel.addPrefixWithSpecialColorOnLabel(text: vm.organization.address, prefix: Localizable.titleAdressBank())
        self.urlBankLogo = ExchangeRatesCustomFunc.getStringfromAn(int: vm.organization.oldId)
        bankLogo.kf.setImage(with: URL(string: urlBankLogo))
    }
    
    func setupLayout() {
        backgroundColor = .white
        
        addSubview(currencyTableView)
        currencyTableView.rowHeight = 70
        currencyTableView.backgroundColor = .white
        currencyTableView.allowsSelection = false
        currencyTableView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(200)
        }
        
        addSubview(headerView)
        headerView.backgroundColor = R.color.grayView()
        headerView.snp.makeConstraints { (make) in
            make.bottom.equalTo(currencyTableView.snp.top)
            make.leading.trailing.equalTo(currencyTableView)
            make.height.equalTo(50)
        }
        
        headerView.addSubview(currencyHeaderName)
        currencyHeaderName.text = Localizable.nameCurrent()
        currencyHeaderName.font = R.font.helveticaNeue(size: 18)
        currencyHeaderName.textColor = R.color.lightGrey()
        currencyHeaderName.snp.makeConstraints { (make) in
            make.top.height.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(150)
        }
        
        headerView.addSubview(purchaseSaleTitleHeaderLabel)
        purchaseSaleTitleHeaderLabel.text = Localizable.actionCurrent()
        purchaseSaleTitleHeaderLabel.font = R.font.helveticaNeue(size: 18)
        purchaseSaleTitleHeaderLabel.textColor = R.color.lightGrey()
        purchaseSaleTitleHeaderLabel.snp.makeConstraints { (make) in
            make.top.trailing.height.equalToSuperview()
            make.width.equalTo(170)
        }
        
        addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.font = R.font.helveticaNeue(size: 34)
        titleLabel.textColor = R.color.lightDark()
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(80)
            make.leading.trailing.equalToSuperview().offset(15)
        }
        
        addSubview(contentBankScrollView)
        contentBankScrollView.bounces = false
        contentBankScrollView.showsVerticalScrollIndicator = false
        contentBankScrollView.contentSize = CGSize(width: contentBankScrollView.bounds.size.width, height: 270)
        contentBankScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(80)
            make.bottom.equalTo(headerView.snp.top)
        }

        contentBankScrollView.addSubview(bankLogo)
        bankLogo.contentMode = .scaleAspectFit
        bankLogo.snp.makeConstraints { (make) in
            make.top.width.equalToSuperview()
            make.height.equalTo(120)
            make.centerX.equalTo(headerView.snp.centerX)
        }
        
        contentBankScrollView.addSubview(linkBankLabel)
        linkBankLabel.numberOfLines = 0
        linkBankLabel.textColor = R.color.lightBlue()
        linkBankLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(bankLogo.snp.bottom).offset(20)
        }
        
        contentBankScrollView.addSubview(adressBankLabel)
        adressBankLabel.numberOfLines = 0
        adressBankLabel.textColor = R.color.lightBlue()
        adressBankLabel.snp.makeConstraints { (make) in
            make.top.equalTo(linkBankLabel.snp.bottom).offset(5)
            make.width.equalToSuperview()
        }
        
        contentBankScrollView.addSubview(phoneNumberLabel)
        phoneNumberLabel.numberOfLines = 0
        phoneNumberLabel.textColor = R.color.lightBlue()
        phoneNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(adressBankLabel.snp.bottom).offset(5)
            make.width.equalToSuperview()
        }
        
        addSubview(detailButton)
        detailButton.setImage(R.image.float(), for: .normal)
        detailButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-45)
            make.width.height.equalTo(70)
        }
        detailButton.addTargetClosure { [unowned self] _ in
            self.delegate?.detailButtonAction()
        }
    }
}

extension DetailBankView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = currencyTableView.dequeueReusableCell(withIdentifier: String(describing: DetailTableViewCell.self)) as? DetailTableViewCell else { return UITableViewCell() }
        cell.purchaseLabel.text = currencyArray[indexPath.row].bid
        cell.saleLabel.text = currencyArray[indexPath.row].ask
        cell.currencyNameLabel.text = currencyName[indexPath.row]
        return cell
    }
}
