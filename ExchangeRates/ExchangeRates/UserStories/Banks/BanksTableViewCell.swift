//
//  BanksTableViewCell.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class BanksTableViewCell: UITableViewCell {
    
    let bank: BankModel
    let titleBankLabel = UILabel()
    let bankLogo = UIImageView()
    let nameCityLabel = UILabel()
    let titleAdressPhoneLabel = UILabel()
    let barStackView = UIStackView()
    
    init(bank: BankModel) {
        self.bank = bank
        super.init(style: .default, reuseIdentifier: "Cell")
        setContentView()
        setLayerTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContentView() {
        
        addSubview(titleBankLabel)
        titleBankLabel.text = bank.title
        titleBankLabel.font = R.font.helveticaNeue(size: 26)
        titleBankLabel.textColor = R.color.lightDark()
        nameCityLabel.numberOfLines = 0
        titleBankLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(15)
        }
        
        addSubview(bankLogo)
        bankLogo.image = UIImage(named: bank.logo)
        bankLogo.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.width.equalTo(100)
            make.height.equalTo(75)
        }
        
        addSubview(nameCityLabel)
        nameCityLabel.text = bank.city
        nameCityLabel.textColor = R.color.lightGrey()
        nameCityLabel.font = R.font.helveticaNeue(size: 20)
        nameCityLabel.numberOfLines = 0
        nameCityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleBankLabel).offset(50)
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(contentView.bounds.width / 2)
        }
        
        addSubview(titleAdressPhoneLabel)
        titleAdressPhoneLabel.text = bank.phone + bank.adress
        titleAdressPhoneLabel.numberOfLines = 0
        titleAdressPhoneLabel.textColor = R.color.lightGrey()
        titleAdressPhoneLabel.font = R.font.helveticaNeue(size: 15)
        titleAdressPhoneLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(bankLogo).offset(100)
            make.width.equalTo(contentView.bounds.width / 3)
        }
        
        addSubview(barStackView)
        let arrayImages = [R.image.link(), R.image.location(), R.image.phone(), R.image.menu()]
        for index in 0..<arrayImages.count {
            barStackView.addArrangedSubview(UIImageView(image: arrayImages[index]))
        }
        //barStackView.contentMode = .scaleAspectFit
        barStackView.axis = .horizontal
        //barStackView.spacing = 10
        barStackView.distribution = .equalSpacing
        barStackView.alignment = .center
        barStackView.backgroundColor = R.color.grayView()
        barStackView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    //    override func layoutSubviews() {
    //        super.layoutSubviews()
    //        frame = frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    //    }
    
    func setLayerTableView() {
        layer.cornerRadius = 5
        layer.shadowOffset = CGSize(width: 4, height: 5)
        layer.shadowOpacity = 0.1
        layer.borderColor = UIColor.gray.cgColor
    }
}
