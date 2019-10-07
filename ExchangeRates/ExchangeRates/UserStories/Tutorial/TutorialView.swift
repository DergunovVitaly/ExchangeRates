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
    
    private var imageArray: [CreateTutorialView] // This is NOT imageArray
    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()
    private let boundsWight = UIScreen.main.bounds.width
    
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
        scrollView.contentSize = CGSize(width: boundsWight * CGFloat(imageArray.count), height: UIScreen.main.bounds.height)
        scrollView.backgroundColor = .white
        scrollView.isPagingEnabled = true
        scrollView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
        }
        //TODO: Add cycle
        scrollView.addSubview(imageArray[0])
        imageArray[0].snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
        }
        
        scrollView.addSubview(imageArray[1])
        imageArray[1].snp.makeConstraints { (make) in
            make.height.width.equalToSuperview()
            make.leading.equalToSuperview().offset(boundsWight)
            make.top.equalToSuperview()
        }
        
        scrollView.addSubview(imageArray[2])
        imageArray[2].snp.makeConstraints { (make) in
            //TODO: width.height.top
            make.height.equalToSuperview()
            make.leading.equalToSuperview().offset(boundsWight * 2)
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        
        //TODO: add logic
        addSubview(pageControl)
        pageControl.numberOfPages = 3
        pageControl.currentPage = 1
        pageControl.pageIndicatorTintColor = R.color.lightGrey()
        pageControl.currentPageIndicatorTintColor = R.color.lightBlue()
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-150)
            
        }
   
    }
}
