//
//  DetailView.swift
//  ExchangeRates
//
//  Created by Mac on 25.10.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit
import Closures

protocol BankViewDelegatDelegate: class {
    func detailButtonAction()
    func tapLinkLabelEvent(url: URL)
    func tapAddressLabelEvent(address: String)
    func tapPhoneNumberLabelEvent(number: String)
}

class DetailBankView: UIView {
   
    weak var delegate: BankViewDelegatDelegate?
    
    private var currencyArray: [Currency] = []
    private var currencyName: [String] = []
    private var linkURL: URL?
    private var address: String?
    private var phoneNumber: String?
    private var urlBankLogo = String()
    private let currencyTableView = UITableView()
    private let headerView = UIView()
    private let currencyHeaderNameLabel = UILabel()
    private let purchaseSaleTitleHeaderLabel = UILabel()
    private let titleLabel = UILabel()
    private let bankLogoImageView = UIImageView()
    private let detailButton = UIButton()
    private let contentBankScrollView = UIScrollView()
    private let linkBankLabel = UILabel()
    private let addressBankLabel = UILabel()
    private let phoneNumberBankLabel = UILabel()
    
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
        titleLabel.text = vm.organizationTitle
        currencyArray = vm.organization.currencies.map { $0.value }
        currencyName = vm.organization.currencies.map { $0.key }
        linkBankLabel.addPrefixWithSpecialColorOnLabel(text: vm.organizationLink.deleteLastLettersAfter(character: "/"), prefix: Localizable.link())
        phoneNumberBankLabel.addPrefixWithSpecialColorOnLabel(text: vm.organization.phone.formatPhoneNumber(), prefix: Localizable.titlePhoneLongNumber())
        addressBankLabel.addPrefixWithSpecialColorOnLabel(text: vm.organization.address, prefix: Localizable.titleAdressBank())
        urlBankLogo = ExchangeRatesCustomFunc.getStringfromAn(int: vm.organization.oldId)
        bankLogoImageView.kf.setImage(with: URL(string: urlBankLogo))
        linkURL = URL(string: vm.organizationLink.deleteLastLettersAfter(character: "/"))
        address = vm.organizationAddress
        phoneNumber = vm.organizationPhone
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
        
        headerView.addSubview(currencyHeaderNameLabel)
        currencyHeaderNameLabel.text = Localizable.nameCurrent()
        currencyHeaderNameLabel.font = R.font.helveticaNeue(size: 18)
        currencyHeaderNameLabel.textColor = R.color.lightGrey()
        currencyHeaderNameLabel.snp.makeConstraints { (make) in
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
        contentBankScrollView.showsVerticalScrollIndicator = true
        contentBankScrollView.contentSize = CGSize(width: contentBankScrollView.bounds.size.width, height: 270)
        contentBankScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(80)
            make.bottom.equalTo(headerView.snp.top)
        }
        
        contentBankScrollView.addSubview(bankLogoImageView)
        bankLogoImageView.contentMode = .scaleAspectFit
        bankLogoImageView.snp.makeConstraints { (make) in
            make.top.width.equalToSuperview()
            make.height.equalTo(120)
            make.centerX.equalTo(headerView.snp.centerX)
        }
        
        contentBankScrollView.addSubview(linkBankLabel)
        linkBankLabel.isUserInteractionEnabled = true
        linkBankLabel.numberOfLines = 0
        linkBankLabel.textColor = R.color.lightBlue()
        linkBankLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(bankLogoImageView.snp.bottom).offset(20)
        }
        
        linkBankLabel.addTapGesture { [unowned self] (_) in
            guard let url = self.linkURL else { return }
            self.delegate?.tapLinkLabelEvent(url: url)
        }

        contentBankScrollView.addSubview(addressBankLabel)
        addressBankLabel.numberOfLines = 0
        addressBankLabel.isUserInteractionEnabled = true
        addressBankLabel.textColor = R.color.lightBlue()
        addressBankLabel.snp.makeConstraints { (make) in
            make.top.equalTo(linkBankLabel.snp.bottom).offset(5)
            make.width.equalToSuperview()
        }
        addressBankLabel.addTapGesture { [unowned self] (_) in
            self.delegate?.tapAddressLabelEvent(address: self.address ?? "")
        }
        
        contentBankScrollView.addSubview(phoneNumberBankLabel)
        phoneNumberBankLabel.numberOfLines = 0
        phoneNumberBankLabel.isUserInteractionEnabled = true
        phoneNumberBankLabel.textColor = R.color.lightBlue()
        phoneNumberBankLabel.snp.makeConstraints { (make) in
            make.top.equalTo(addressBankLabel.snp.bottom).offset(5)
            make.width.equalToSuperview()
        }
        phoneNumberBankLabel.addTapGesture { [unowned self] (_) in
            self.delegate?.tapPhoneNumberLabelEvent(number: self.phoneNumber ?? "")
        }
        
        addSubview(detailButton)
        detailButton.setImage(R.image.float(), for: .normal)
        detailButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-45)
            make.width.height.equalTo(70)
        }
        
        detailButton.onTap { [unowned self] in
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
        cell.askLabel.text = currencyArray[indexPath.row].bid
        cell.bidLabel.text = currencyArray[indexPath.row].ask
        cell.currencyNameLabel.text = currencyName[indexPath.row]
        return cell
    }
}
