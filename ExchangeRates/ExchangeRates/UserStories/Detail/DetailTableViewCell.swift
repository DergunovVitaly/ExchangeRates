//
//  DetailTableViewCell.swift
//  ExchangeRates
//
//  Created by Mac on 25.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    private let currencyModel : CurrencyModel
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let purchaseLabel = UILabel()
    private let saleLabel = UILabel()
    private let imageUp = UIImageView()
    private let imageDown = UIImageView()
    
    init(currencyModel: CurrencyModel) {
        self.currencyModel = currencyModel
        super.init(style: .default, reuseIdentifier: "cellDetail")
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        addSubview(nameLabel)
        nameLabel.text = currencyModel.name
        nameLabel.textColor = R.color.lightDark()
        nameLabel.font = R.font.helveticaNeue(size: 18)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(30)
            make.top.height.equalToSuperview()
            make.width.equalTo(50)
        }
        
        addSubview(descriptionLabel)
        descriptionLabel.text = currencyModel.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = R.color.lightGrey()
        descriptionLabel.font = R.font.helveticaNeue(size: 16)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.height.equalTo(nameLabel)
            make.width.equalTo(150)
            make.leading.equalTo(nameLabel).offset(50)
        }
        
        addSubview(purchaseLabel)
        purchaseLabel.text = currencyModel.bid
        purchaseLabel.font = R.font.helveticaNeue(size: 14)
        purchaseLabel.textColor = R.color.lightGrey()
        purchaseLabel.snp.makeConstraints { (make) in
            make.top.trailing.equalToSuperview().offset(15)
            make.height.equalTo(bounds.height / 2)
            make.width.equalTo(100)
        }
        
        addSubview(saleLabel)
        saleLabel.text = currencyModel.ask
        saleLabel.font = R.font.helveticaNeue(size: 14)
        saleLabel.textColor = R.color.lightGrey()
        saleLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(purchaseLabel)
            make.top.equalTo(purchaseLabel).offset(22)
            make.height.width.equalTo(purchaseLabel)
        }
        
        addSubview(imageUp)
        imageUp.image = R.image.arrowUp()
        imageUp.snp.makeConstraints { (make) in
            make.top.equalTo(purchaseLabel).offset(5)
            make.height.equalTo(purchaseLabel).offset(-10)
            make.leading.equalTo(purchaseLabel).offset(-30)
        }
        
        addSubview(imageDown)
        imageDown.image = R.image.arrowDown()
        imageDown.snp.makeConstraints { (make) in
            make.height.leading.equalTo(imageUp)
            make.top.equalTo(saleLabel).offset(5)
        }
    }
}
