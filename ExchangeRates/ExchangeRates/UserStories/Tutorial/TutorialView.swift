//
//  TutorialView.swift
//  ExchangeRates
//
//  Created by Mac on 06/10/2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation
import UIKit

protocol TutorialViewDelegate: class {
    func startButtonEvent()
}

class TutorialView: UIView {
    
    private var viewArray: [CreateTutorialView]
    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()
    private let boundsWight = UIScreen.main.bounds.width
    private let startButtonAction = UIButton()
    private var coinsImageView: UIImageView
    private let widthCoinsImageView: CGFloat = 150
    private let heightCoinsImageView: CGFloat = UIScreen.height * 0.54
    private let xPositionCoinsImageView: CGFloat = UIScreen.width * 0.66
    private(set) var yPositionCoinsImageView: CGFloat = UIScreen.height * 0.75
    
    init(frame: CGRect, imageArray: [CreateTutorialView]) {
        self.viewArray = imageArray
        coinsImageView = UIImageView(frame: CGRect(x: xPositionCoinsImageView, y: yPositionCoinsImageView, width: widthCoinsImageView, height: heightCoinsImageView))
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
        
        addSubview(coinsImageView)
        coinsImageView.contentMode = .scaleAspectFill
        coinsImageView.image = R.image.coins()
        coinsImageView.alpha = 0.4
        
        addSubview(scrollView)
        scrollView.contentSize = CGSize(width: boundsWight * CGFloat(viewArray.count), height: UIScreen.main.bounds.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        scrollView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
        }
        
        for index in 0..<viewArray.count {
            scrollView.addSubview(viewArray[index])
            viewArray[index].snp.makeConstraints { (make) in
                make.width.height.equalToSuperview()
                make.leading.equalToSuperview().offset(boundsWight * CGFloat(index))
            }
        }
        
        addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.hidesForSinglePage = true
        pageControl.pageIndicatorTintColor = R.color.lightGrey()
        pageControl.currentPageIndicatorTintColor = R.color.lightBlue()
        pageControl.numberOfPages = viewArray.count
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-150)
        }
        
        addSubview(startButtonAction)
        startButtonAction.backgroundColor = R.color.lightBlue()
        startButtonAction.titleLabel?.font = R.font.helveticaNeueBold(size: 14)
        startButtonAction.setTitle(Localizable.titleButton(), for: .normal)
        startButtonAction.layer.cornerRadius = 30
        startButtonAction.addTarget(self, action: #selector(startButtonActionSelector), for: .touchUpInside)
        startButtonAction.snp.makeConstraints { (make) in
            make.width.equalTo(250)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func startButtonActionSelector() {
        delegate?.startButtonEvent()
    }
}

extension TutorialView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOfsetX = scrollView.contentOffset.x
        let frame = boundsWight
        let pageIndex = round(CGFloat(contentOfsetX) / frame)
        pageControl.currentPage = Int(pageIndex)
        
        self.yPositionCoinsImageView = UIScreen.main.bounds.height * 0.75
        self.yPositionCoinsImageView -= round(CGFloat(contentOfsetX) / 5 )
        UIView.animate(withDuration: 1.0, animations: {
            self.coinsImageView.frame = CGRect(x: self.xPositionCoinsImageView, y: self.yPositionCoinsImageView, width: self.widthCoinsImageView, height: self.heightCoinsImageView)
        })
    }
}
