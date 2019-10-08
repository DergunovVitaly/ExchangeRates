//
//  TutorialView.swift
//  ExchangeRates
//
//  Created by Mac on 06/10/2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Foundation
import UIKit

protocol TutorialViewDelegate: class {
    func tupButton()
}

class TutorialView: UIView {
    
    private var numberOfPages: Int
    private var viewArray: [CreateTutorialView] 
    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()
    private let boundsWight = UIScreen.main.bounds.width
    private let startButton = UIButton()
    private let coinsImageView = UIImageView()
    
    init(frame: CGRect, imageArray: [CreateTutorialView], numberOfPages: Int) {
        self.numberOfPages = numberOfPages
        self.viewArray = imageArray
        super.init(frame: frame)
        backgroundColor = .white
        scrollView.delegate = self
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: TutorialViewDelegate?
  
    private func setupLayout() {
        addSubview(scrollView)
        scrollView.contentSize = CGSize(width: boundsWight * CGFloat(viewArray.count), height: UIScreen.main.bounds.height)
        scrollView.backgroundColor = .white
        scrollView.isPagingEnabled = true
        scrollView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
        }
        
        for index in 0..<viewArray.count {
            scrollView.addSubview(viewArray[index])
            viewArray[index].snp.makeConstraints { (make) in
                make.width.height.equalToSuperview()
                if index == 1 {
                    make.height.width.top.equalToSuperview()
                    make.leading.equalToSuperview().offset(boundsWight)
                } else if index == 2 {
                    make.leading.equalToSuperview().offset(boundsWight * 2)
                }
            }
        }
    
        insertSubview(pageControl, at: 0)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(0.8)
        pageControl.hidesForSinglePage = true
        pageControl.pageIndicatorTintColor = R.color.lightGrey()
        pageControl.currentPageIndicatorTintColor = R.color.lightBlue()
        pageControl.numberOfPages = numberOfPages
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-150)
        }
        
        addSubview(startButton)
        startButton.backgroundColor = R.color.lightBlue()
        startButton.titleLabel?.font = R.font.helveticaNeueBold(size: 14)
        startButton.setTitle(Localizable.titleButton(), for: .normal)
        startButton.layer.cornerRadius = 30
        startButton.addTarget(self, action: #selector(tupButton), for: .touchUpInside)
        startButton.snp.makeConstraints { (make) in
            make.width.equalTo(250)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-60)
            make.centerX.equalToSuperview()
        }
        
        addSubview(coinsImageView)
        coinsImageView.image = R.image.coins()
        coinsImageView.alpha = 0.2
        coinsImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(50)
            make.right.equalTo(0)
            make.height.equalTo(360)
            make.width.equalTo(150)
            make.centerYWithinMargins.equalTo(100)
        }
    }
    
    @objc func tupButton() {
        delegate?.tupButton()
    }
}

extension TutorialView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOfsetX = scrollView.contentOffset.x
        let frame = UIScreen.main.bounds.width
        let pageIndex = round(CGFloat(contentOfsetX) / frame)
        pageControl.currentPage = Int(pageIndex)
    }
}
