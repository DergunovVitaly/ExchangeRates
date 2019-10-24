//
//  BanksTableViewCell.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

protocol BanksTableViewCellDelegate: class {
    func linkButtonAction()
    func locationButtonAction()
    func phoneButtonAction()
    func menuButtonAction()
}

class BanksTableViewCell: UITableViewCell {
    
    private let titleBankLabel = UILabel()
    private let bankLogo = UIImageView()
    private let nameCityLabel = UILabel()
    private let titlePhoneLabel = UILabel()
    private let titleAdressLabel = UILabel()
    private let nameRegionsLabel = UILabel()
    private let barStackView = UIStackView()
    private let linkButton = UIButton()
    private let locationButton = UIButton()
    private let phoneButton = UIButton()
    private let menuButton = UIButton()
    weak var delegate: BanksTableViewCellDelegate?
    
    init() {
        super.init(style: .default, reuseIdentifier: "Cell")
        setupLayout()
        setLayerTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateBankModel(bankModel: BankModel) {
        titleBankLabel.text = bankModel.title
        bankLogo.image = UIImage(named: bankModel.logo)
        nameRegionsLabel.text = bankModel.regions
        nameCityLabel.text = bankModel.cities
        titlePhoneLabel.text = "Тел.: " + bankModel.phone
        titleAdressLabel.text = "Адреса: " + bankModel.address
    }
    
    func setupLayout() {
        
        addSubview(titleBankLabel)
        titleBankLabel.font = R.font.helveticaNeue(size: 26)
        titleBankLabel.textColor = R.color.lightDark()
        titleBankLabel.numberOfLines = 0
        titleBankLabel.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(44)
        }
        
        addSubview(bankLogo)
        bankLogo.contentMode = .scaleAspectFit
        bankLogo.snp.makeConstraints { (make) in
            make.top.trailing.equalTo(titleBankLabel)
            make.width.equalTo(100)
            make.height.equalTo(75)
        }
        
        addSubview(nameRegionsLabel)
        nameRegionsLabel.textColor = R.color.lightGrey()
        nameRegionsLabel.font = R.font.helveticaNeue(size: 20)
        nameRegionsLabel.numberOfLines = 0
        nameRegionsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleBankLabel).offset(20)
            make.leading.equalTo(titleBankLabel)
            make.width.equalTo(contentView.bounds.width / 2)
            make.bottom.equalToSuperview().offset(-40)
        }
        
        addSubview(nameCityLabel)
        nameCityLabel.textColor = R.color.lightGrey()
        nameCityLabel.font = R.font.helveticaNeue(size: 20)
        nameCityLabel.numberOfLines = 0
        nameCityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameRegionsLabel).offset(65)
            make.leading.equalTo(nameRegionsLabel)
            make.width.equalTo(nameRegionsLabel)
            make.bottom.equalToSuperview().offset(-40)
        }
        
        addSubview(titlePhoneLabel)
        titlePhoneLabel.numberOfLines = 0
        titlePhoneLabel.textColor = R.color.lightGrey()
        titlePhoneLabel.font = R.font.helveticaNeue(size: 15)
        titlePhoneLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(bankLogo)
            make.top.equalTo(nameRegionsLabel).offset(45)
            make.height.equalTo(40)
            make.width.equalTo((contentView.bounds.width / 2) - 20)
        }
        
        addSubview(titleAdressLabel)
        titleAdressLabel.numberOfLines = 0
        titleAdressLabel.textColor = R.color.lightGrey()
        titleAdressLabel.font = R.font.helveticaNeue(size: 15)
        titleAdressLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(bankLogo)
            make.top.equalTo(titlePhoneLabel).offset(25)
            make.height.equalTo(40)
            make.width.equalTo(titlePhoneLabel)
        }
        
        addSubview(barStackView)
        barStackView.contentMode = .scaleToFill
        barStackView.axis = .horizontal
        barStackView.spacing = 10
        barStackView.isLayoutMarginsRelativeArrangement = true
        barStackView.layoutMargins = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
        barStackView.addBackground(color: R.color.grayView()!)
        barStackView.distribution = .equalSpacing
        barStackView.alignment = .center
        barStackView.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
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
        
        barStackView.addArrangedSubview(menuButton)
        menuButton.imageView?.contentMode = .scaleAspectFit
        menuButton.setImage(R.image.menu(), for: .normal)
        
        linkButton.addTarget(self, action: #selector(linkButtonSelection), for: .touchUpInside)
        locationButton.addTarget(self, action: #selector(locationButtonSelection), for: .touchUpInside)
        phoneButton.addTarget(self, action: #selector(phoneButtonSelection), for: .touchUpInside)
        menuButton.addTarget(self, action: #selector(menuButtonSelection), for: .touchUpInside)
    }
    
    @objc func linkButtonSelection(){
        
    }
    @objc func locationButtonSelection(){
        
    }
    @objc   func phoneButtonSelection(){
        
    }
    @objc   func menuButtonSelection(){
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        frame = frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    func setLayerTableViewCell() {
        layer.cornerRadius = 5
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 0.1
    }
}

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
