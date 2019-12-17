//
//  DetailTableViewCell.swift
//  ExchangeRates
//
//  Created by Mac on 25.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    let purchaseLabel = UILabel()
    let saleLabel = UILabel()
    let currencyNameLabel = UILabel()
    private let nameLabel = UILabel()
    private let imageUp = UIImageView()
    private let imageDown = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .white
        
        addSubview(nameLabel)
        nameLabel.textColor = R.color.lightDark()
        nameLabel.font = R.font.helveticaNeue(size: 18)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(30)
            make.top.height.equalToSuperview()
            make.width.equalTo(50)
        }
        
        addSubview(currencyNameLabel)
        currencyNameLabel.numberOfLines = 0
        currencyNameLabel.textColor = R.color.lightGrey()
        currencyNameLabel.font = R.font.helveticaNeue(size: 16)
        currencyNameLabel.snp.makeConstraints { (make) in
            make.top.height.leading.equalTo(nameLabel)
            make.width.equalTo(150)
        }
        
        addSubview(purchaseLabel)
        purchaseLabel.font = R.font.helveticaNeue(size: 14)
        purchaseLabel.textColor = R.color.lightGrey()
        purchaseLabel.snp.makeConstraints { (make) in
            make.top.trailing.equalToSuperview().offset(15)
            make.height.equalTo(bounds.height / 2)
            make.width.equalTo(100)
        }
        
        addSubview(saleLabel)
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
