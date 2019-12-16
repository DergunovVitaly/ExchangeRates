//
//  BanksTableViewCell.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
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
    let urlForImageBankLogo: String
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
    
    
    init(organizations: Organization, regionsName: String, cityName: String, urlForImageBankLogo: String) {
        self.organizations = organizations
        self.cityName = cityName
        self.regionsName = regionsName
        self.urlForImageBankLogo = urlForImageBankLogo
        self.nameRegionsLabel.text = regionsName
        if self.nameRegionsLabel.text == cityName {
            self.nameRegionsLabel.text = regionsName.add(postfix: Localizable.longNameCountry())
        }
        self.nameCityLabel.text = cityName.add(prefix: Localizable.titleShortCityName())
        self.titleBankLabel.text = organizations.title
        self.phoneLabel.text = organizations.phone.number().add(prefix: Localizable.titlePhoneShortNumber())
        self.adressLabel.text = organizations.address.add(prefix: Localizable.titleAdressBank())
        bankLogo.kf.setImage(with: URL(string: urlForImageBankLogo))
        super.init(style: .default, reuseIdentifier: String(describing: BankTableViewCell.self))
        setupLayout()
        setLayerTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout() {
        backgroundColor = .red
        
        contentView.addSubview(titleBankLabel)
        titleBankLabel.font = R.font.helveticaNeue(size: 26)
        titleBankLabel.textColor = R.color.lightDark()
        titleBankLabel.numberOfLines = 0
        titleBankLabel.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(15)
            make.width.equalTo(200)
        }
        
        contentView.addSubview(nameRegionsLabel)
        nameRegionsLabel.textColor = R.color.lightGrey()
        nameRegionsLabel.font = R.font.helveticaNeue(size: 20)
        nameRegionsLabel.numberOfLines = 0
        nameRegionsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleBankLabel.snp.bottom).offset(25)
            make.leading.equalTo(titleBankLabel)
            make.trailing.equalToSuperview().inset(115)
        }
        
        contentView.addSubview(nameCityLabel)
        nameCityLabel.textColor = R.color.lightGrey()
        nameCityLabel.font = R.font.helveticaNeue(size: 20)
        nameCityLabel.numberOfLines = 0
        nameCityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameRegionsLabel.snp.bottom).offset(10)
            make.leading.equalTo(nameRegionsLabel)
            make.width.equalTo(nameRegionsLabel)
            make.bottom.equalToSuperview().offset(-50)
        }
        
        contentView.addSubview(bankLogo)
        bankLogo.contentMode = .scaleAspectFit
        bankLogo.snp.makeConstraints { (make) in
            make.top.equalTo(titleBankLabel)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        contentView.addSubview(phoneLabel)
        phoneLabel.numberOfLines = 0
        phoneLabel.textAlignment = .right
        phoneLabel.textColor = R.color.lightGrey()
        phoneLabel.font = R.font.helveticaNeue(size: 15)
        phoneLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(bankLogo.snp.bottom).offset(10)
        }
        
        contentView.addSubview(adressLabel)
        adressLabel.textAlignment = .right
        adressLabel.numberOfLines = 0
        adressLabel.textColor = R.color.lightGrey()
        adressLabel.font = R.font.helveticaNeue(size: 15)
        adressLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(phoneLabel)
            make.top.equalTo(phoneLabel.snp.bottom)
            make.width.equalTo(contentView.bounds.width / 2)
            make.bottom.equalToSuperview().offset(-50)
        }
        
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
        detailButton.snp.makeConstraints { (make) in
            make.width.equalTo(40)
        }
        
        linkButton.addTargetClosure { [unowned self] (btn) in
            self.delegate?.linkButtonAction(cell: self)
        }
        
        locationButton.addTargetClosure { [unowned self] (btn) in
            self.delegate?.locationButtonAction()
        }
        
        phoneButton.addTargetClosure { [unowned self] (btn) in
            self.delegate?.phoneButtonAction()
        }
        
        detailButton.addTargetClosure { [unowned self] (btn) in
            self.delegate?.detailButtonAction(cell: self)
        }
    }
    
    private func setLayerTableViewCell() {
        layer.cornerRadius = 5
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 0.1
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15,
                                                                     left: 15,
                                                                     bottom: 0,
                                                                     right: 15))
    }
}
