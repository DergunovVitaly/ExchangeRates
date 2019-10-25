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
    
    init() {
        super.init(style: .default, reuseIdentifier: "cellDetail")
        setupLayout()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        addSubview(nameLabel)
        nameLabel.text = currencyModel.name
        
        addSubview(descriptionLabel)
        descriptionLabel.text = currencyModel.description
    }

}
