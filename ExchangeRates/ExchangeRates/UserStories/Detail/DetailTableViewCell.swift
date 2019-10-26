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
    
    init(currencyModel: CurrencyModel ) {
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
    }
}
