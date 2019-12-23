//
//  ExtangeRateCell.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 21.12.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation
import UIKit

class ExtangeRateCell: UICollectionViewCell {
    
    let bidLabel = UILabel()
    let askLabel = UILabel()
    let currencyNameLabel = UILabel()
    private let bidImageView = UIImageView()
    private let askImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        contentView.addSubview(currencyNameLabel)
        contentView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = R.color.lightBlue()?.cgColor
        contentView.layer.borderWidth = 2
        currencyNameLabel.textAlignment = .center
        currencyNameLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(5)
            make.top.bottom.equalToSuperview()
        }
        
        let imagesStackView = UIStackView(arrangedSubviews: [bidImageView, askImageView])
        bidImageView.image = R.image.arrowUp()
        askImageView.image = R.image.arrowDown()
        imagesStackView.alignment = .fill
        imagesStackView.axis = .vertical
        imagesStackView.spacing = 10
        
        contentView.addSubview(imagesStackView)
        imagesStackView.snp.makeConstraints { (make) in
            make.leading.equalTo(currencyNameLabel.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        
        let ratesStackView = UIStackView(arrangedSubviews: [askLabel, bidLabel])
        askLabel.font = R.font.helveticaNeue(size: 14)
        askLabel.textColor = .black
        bidLabel.font = R.font.helveticaNeue(size: 14)
        bidLabel.textColor = .black
        ratesStackView.alignment = .fill
        ratesStackView.axis = .vertical
        ratesStackView.spacing = 5
        
        contentView.addSubview(ratesStackView)
        ratesStackView.snp.makeConstraints { (make) in
            make.leading.equalTo(imagesStackView.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
    }
}
