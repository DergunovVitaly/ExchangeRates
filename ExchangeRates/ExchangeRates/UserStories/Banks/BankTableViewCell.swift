//
//  BanksTableViewCell.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import UIKit
import Kingfisher

protocol BanksTableViewCellDelegate: class {
    func linkButtonAction(cell: BankTableViewCell)
    func locationButtonAction()
    func phoneButtonAction()
    func detailButtonAction(cell: BankTableViewCell)
}

class BankTableViewCell: UITableViewCell {
    
    weak var delegate: BanksTableViewCellDelegate?
    
    let organizations: Organization
    let regionsName: String
    let cityName: String
    private let titleBankLabel = UILabel()
    private let bankLogo = UIImageView()
    private let nameCityLabel = UILabel()
    private let phoneLabel = UILabel()
    private let adressLabel = UILabel()
    private let nameRegionsLabel = UILabel()
    private let barStackView = UIStackView()
    private let linkButton = UIButton()
    private let locationButton = UIButton()
    private let phoneButton = UIButton()
    private let detailButton = UIButton()
    
    init(organizations: Organization, regionsName: String, cityName: String) {
        self.organizations = organizations
        self.regionsName = regionsName
        self.cityName = cityName
        self.nameRegionsLabel.text = regionsName
        self.nameCityLabel.text = cityName
        self.titleBankLabel.text = organizations.title
        self.phoneLabel.text = organizations.phone
        self.adressLabel.text = organizations.address
        super.init(style: .default, reuseIdentifier: String(describing: BankTableViewCell.self))
        setupLayout()
        setLayerTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        contentView.addSubview(titleBankLabel)
        titleBankLabel.font = R.font.helveticaNeue(size: 26)
        titleBankLabel.textColor = R.color.lightDark()
        titleBankLabel.numberOfLines = 0
        titleBankLabel.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(15)
            make.width.equalTo(150)
        }
        
        contentView.addSubview(bankLogo)
        bankLogo.contentMode = .scaleAspectFit
        //TODO: move to BanksVC
        let url = URL(string: "https://static.finance.ua/img/ext/org-logo/88/\(String(organizations.oldId)).png")
        bankLogo.kf.setImage(with: url)
        
        bankLogo.snp.makeConstraints { (make) in
            make.top.equalTo(titleBankLabel)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(100)
            make.height.equalTo(75)
        }
        
        contentView.addSubview(nameRegionsLabel)
        nameRegionsLabel.textColor = R.color.lightGrey()
        nameRegionsLabel.font = R.font.helveticaNeue(size: 20)
        nameRegionsLabel.numberOfLines = 0
        nameRegionsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleBankLabel.snp.bottom).offset(20)
            make.leading.equalTo(titleBankLabel)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
//        contentView.addSubview(nameCityLabel)
//        nameCityLabel.textColor = R.color.lightGrey()
//        nameCityLabel.font = R.font.helveticaNeue(size: 20)
//        nameCityLabel.numberOfLines = 0
//        nameCityLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(nameRegionsLabel.snp.bottom).offset(65)
//            make.leading.equalTo(nameRegionsLabel)
//            make.width.height.equalTo(nameRegionsLabel)
//            
//        }
//
//        contentView.addSubview(phoneLabel)
//        phoneLabel.numberOfLines = 0
//        phoneLabel.textColor = R.color.lightGrey()
//        phoneLabel.font = R.font.helveticaNeue(size: 15)
//        phoneLabel.snp.makeConstraints { (make) in
//            make.trailing.equalToSuperview().offset(-20)
//            make.top.equalTo(nameRegionsLabel)
//            make.width.equalTo(contentView.bounds.width / 2)
//            make.height.equalTo(30)
//        }
//
//        contentView.addSubview(adressLabel)
//        adressLabel.numberOfLines = 0
//        adressLabel.textColor = R.color.lightGrey()
//        adressLabel.font = R.font.helveticaNeue(size: 15)
//        adressLabel.snp.makeConstraints { (make) in
//            make.trailing.equalTo(phoneLabel)
//            make.top.equalTo(phoneLabel).offset(25)
//            make.width.height.equalTo(phoneLabel)
//        }

        contentView.addSubview(barStackView)
        barStackView.contentMode = .scaleToFill
        barStackView.axis = .horizontal
        barStackView.spacing = 10
        barStackView.isLayoutMarginsRelativeArrangement = true
        barStackView.layoutMargins = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
        barStackView.addBackground(color: R.color.grayView()!)
        barStackView.distribution = .equalSpacing
        barStackView.alignment = .center
        barStackView.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        barStackView.addArrangedSubview(linkButton)
        linkButton.setImage(R.image.link(), for: .normal)
        linkButton.imageView?.contentMode = .scaleAspectFit
        
        barStackView.addArrangedSubview(locationButton)
        locationButton.imageView?.contentMode = .scaleAspectFit
        locationButton.setImage(R.image.location(), for: .normal)
        
        barStackView.addArrangedSubview(phoneButton)
        phoneButton.imageView?.contentMode = .scaleAspectFit
        phoneButton.setImage(R.image.phone(), for: .normal)
        
        barStackView.addArrangedSubview(detailButton)
        detailButton.imageView?.contentMode = .scaleAspectFit
        detailButton.setImage(R.image.menu(), for: .normal)
        
        linkButton.addTarget(self, action: #selector(linkButtonSelection), for: .touchUpInside)
        locationButton.addTarget(self, action: #selector(locationButtonSelection), for: .touchUpInside)
        phoneButton.addTarget(self, action: #selector(phoneButtonSelection), for: .touchUpInside)
        detailButton.addTarget(self, action: #selector(detailButtonSelection), for: .touchUpInside)
    }
    //TODO: what does this func do?
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        frame = frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
//    }
    
    @objc func linkButtonSelection(){
        delegate?.linkButtonAction(cell: self)
    }
    @objc func locationButtonSelection(){
        delegate?.locationButtonAction()
    }
    @objc func phoneButtonSelection(){
        delegate?.phoneButtonAction()
    }
    @objc func detailButtonSelection() {
        delegate?.detailButtonAction(cell: self)
    }
    
    private func setLayerTableViewCell() {
        layer.cornerRadius = 5
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 0.1
    }
}
