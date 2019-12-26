//
//  DetailTableViewCell.swift
//  ExchangeRates
//
//  Created by Mac on 25.10.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    let askLabel = UILabel()
    let bidLabel = UILabel()
    let currencyNameLabel = UILabel()
    private let nameLabel = UILabel()
    private let imageUpImageView = UIImageView()
    private let imageDownImageView = UIImageView()
    
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
        
        addSubview(askLabel)
        askLabel.font = R.font.helveticaNeue(size: 14)
        askLabel.textColor = R.color.lightGrey()
        askLabel.snp.makeConstraints { (make) in
            make.top.trailing.equalToSuperview().offset(15)
            make.height.equalTo(bounds.height / 2)
            make.width.equalTo(100)
        }
        
        addSubview(bidLabel)
        bidLabel.font = R.font.helveticaNeue(size: 14)
        bidLabel.textColor = R.color.lightGrey()
        bidLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(askLabel)
            make.top.equalTo(askLabel).offset(22)
            make.height.width.equalTo(askLabel)
        }
        
        addSubview(imageUpImageView)
        imageUpImageView.image = R.image.arrowUp()
        imageUpImageView.snp.makeConstraints { (make) in
            make.top.equalTo(askLabel).offset(5)
            make.height.equalTo(askLabel).offset(-10)
            make.leading.equalTo(askLabel).offset(-30)
        }
        
        addSubview(imageDownImageView)
        imageDownImageView.image = R.image.arrowDown()
        imageDownImageView.snp.makeConstraints { (make) in
            make.height.leading.equalTo(imageUpImageView)
            make.top.equalTo(bidLabel).offset(5)
        }
    }
}
