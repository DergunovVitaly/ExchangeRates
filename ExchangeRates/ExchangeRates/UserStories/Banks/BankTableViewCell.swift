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
    let regionName: String
    let cityName: String
    let urlForImageBankLogo: String
    private let titleBankLabel = UILabel()
    private let bankLogo = UIImageView()
    private let cityNameLabel = UILabel()
    private let phoneLabel = UILabel()
    private let adressLabel = UILabel()
    private let regionNameLabel = UILabel()
    private let barStackView = UIStackView()
    private let linkButton = UIButton()
    private let locationButton = UIButton()
    private let phoneButton = UIButton()
    private let detailButton = UIButton()
    
    init(organizations: Organization, regionsName: String, cityName: String, urlForImageBankLogo: String) {
        self.organizations = organizations
        self.regionName = regionsName
        self.cityName = cityName
        self.urlForImageBankLogo = urlForImageBankLogo
        //TODO: Move to func
        self.regionNameLabel.text = regionsName
        self.cityNameLabel.text = "м. " + cityName
        self.titleBankLabel.text = organizations.title
        self.phoneLabel.text = organizations.phone
        self.adressLabel.text = organizations.address
        bankLogo.kf.setImage(with: URL(string: urlForImageBankLogo))
        super.init(style: .default, reuseIdentifier: String(describing: BankTableViewCell.self))
        setupLayout()
        setLayerTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .white
        
        contentView.addSubview(titleBankLabel)
        titleBankLabel.font = R.font.helveticaNeue(size: 26)
        titleBankLabel.textColor = R.color.lightDark()
        titleBankLabel.numberOfLines = 0
        titleBankLabel.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(15)
            make.width.equalTo(200)
        }
        
        contentView.addSubview(regionNameLabel)
        regionNameLabel.textColor = R.color.lightGrey()
        regionNameLabel.font = R.font.helveticaNeue(size: 20)
        regionNameLabel.numberOfLines = 0
        regionNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleBankLabel.snp.bottom).offset(25)
            make.leading.equalTo(titleBankLabel)
            make.trailing.equalToSuperview().inset(115)
        }
        
        contentView.addSubview(cityNameLabel)
        cityNameLabel.textColor = R.color.lightGrey()
        cityNameLabel.font = R.font.helveticaNeue(size: 20)
        cityNameLabel.numberOfLines = 0
        cityNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(regionNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(regionNameLabel)
            make.width.equalTo(regionNameLabel)
            make.bottom.equalToSuperview().offset(-55)
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
            make.width.equalTo(contentView.bounds.width / 2)
        }
        
        contentView.addSubview(adressLabel)
        adressLabel.textAlignment = .right
        adressLabel.numberOfLines = 0
        adressLabel.textColor = R.color.lightGrey()
        adressLabel.font = R.font.helveticaNeue(size: 15)
        adressLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(phoneLabel)
            make.top.equalTo(phoneLabel.snp.bottom).offset(10)
            make.width.equalTo(phoneLabel)
            make.bottom.equalToSuperview().offset(-55)
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
            make.height.equalTo(44)
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
        linkButton.addTarget(self, action: #selector(linkButtonSelection), for: .touchUpInside)
        locationButton.addTarget(self, action: #selector(locationButtonSelection), for: .touchUpInside)
        phoneButton.addTarget(self, action: #selector(phoneButtonSelection), for: .touchUpInside)
        detailButton.addTarget(self, action: #selector(detailButtonSelection), for: .touchUpInside)
    }
    
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
