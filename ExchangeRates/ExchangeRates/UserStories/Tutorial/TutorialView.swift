//
//  TutorialView.swift
//  ExchangeRates
//
//  Created by Mac on 06/10/2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Foundation
import UIKit

class TutorialView: UIView {

    private var imageArray: [CreateTutorialView]
    private let scrollView = UIScrollView()
    
    init(frame: CGRect, imageArray: [CreateTutorialView]) {
        self.imageArray = imageArray
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLayout() {
        
        addSubview(scrollView)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(imageArray.count), height: UIScreen.main.bounds.height)
        scrollView.backgroundColor = .white
        scrollView.isPagingEnabled = true
        scrollView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }

        scrollView.addSubview(imageArray[0])
        imageArray[0].snp.makeConstraints { (make) in
            make.height.width.equalToSuperview()
        }

        scrollView.addSubview(imageArray[1])
        imageArray[1].snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.leading.equalToSuperview().offset(UIScreen.main.bounds.width)
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        scrollView.addSubview(imageArray[2])
        imageArray[2].snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.leading.equalToSuperview().offset(UIScreen.main.bounds.width * 2)
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}
