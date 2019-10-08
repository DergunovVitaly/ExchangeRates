//
//  TutorialView.swift
//  ExchangeRates
//
//  Created by Mac on 06/10/2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class CreateTutorialView: UIView {
    
    private let imageView = UIImageView()
    private let image: UIImage?
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let titleLabelText: String
    private let descriptionLabelText: String
    
    init(frame: CGRect, image: UIImage?, titleLabelText: String, descriptionLabelText: String) {
        self.image = image
        self.titleLabelText = titleLabelText
        self.descriptionLabelText = descriptionLabelText
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(imageView)
        self.imageView.image = image
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(250)
        }
        
        addSubview(titleLabel)
        self.titleLabel.text = titleLabelText
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = R.color.lightBlue()
        self.titleLabel.font = R.font.helveticaNeueBold(size: 21)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(25)
            make.centerX.equalTo(imageView)
            make.width.equalTo(225)
            make.height.equalTo(30)
        }
        
        addSubview(descriptionLabel)
        self.descriptionLabel.text = descriptionLabelText
        self.descriptionLabel.textAlignment = .center
        self.descriptionLabel.textColor = R.color.lightGrey()
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = R.font.helveticaNeue(size: 16)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.centerX.equalTo(titleLabel)
            make.width.equalTo(titleLabel)
            make.height.greaterThanOrEqualTo(65)
        }
        
        func coinsPosition(position: Int) {
            descriptionLabel.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(position)
            }
        }
    }
}
