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
    func tapStartButtonEvent()
}

class TutorialView: UIView {
    
    private var viewArray: [CreateTutorialView]
    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()
    private let startButtonAction = UIButton()
    private var coinsImageView: UIImageView
    
    private(set) var yPositionCoinsImageView: CGFloat = UIScreen.height * 0.75
    
    init(tutorialView: [CreateTutorialView]) {
        self.viewArray = tutorialView
        coinsImageView = UIImageView(frame: CGRect(x: Constants.xPositionCoinsImageView, y: yPositionCoinsImageView, width: Constants.widthCoinsImageView, height: Constants.heightCoinsImageView))
        super.init(frame: .zero)
        
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
        scrollView.contentSize = CGSize(width: UIScreen.width * CGFloat(viewArray.count), height: UIScreen.height)
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
                make.leading.equalToSuperview().offset(UIScreen.width * CGFloat(index))
            }
        }
        
        
        addSubview(startButtonAction)
        startButtonAction.backgroundColor = R.color.lightBlue()
        startButtonAction.titleLabel?.font = R.font.helveticaNeueBold(size: 14)
        startButtonAction.setTitle(Localizable.titleButton(), for: .normal)
        startButtonAction.layer.cornerRadius = 30
        startButtonAction.snp.makeConstraints { (make) in
            make.width.equalTo(250)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
        }
        
        addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.hidesForSinglePage = true
        pageControl.pageIndicatorTintColor = R.color.lightGrey()
        pageControl.currentPageIndicatorTintColor = R.color.lightBlue()
        pageControl.numberOfPages = viewArray.count
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(startButtonAction.snp.top).offset(-20)
        }
        
        startButtonAction.onTap { [unowned self] in
            self.delegate?.tapStartButtonEvent()
        }
    }
}

extension TutorialView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOfsetX = scrollView.contentOffset.x
        let frame = UIScreen.width
        let pageIndex = round(CGFloat(contentOfsetX) / frame)
        pageControl.currentPage = Int(pageIndex)
        
        self.yPositionCoinsImageView = UIScreen.main.bounds.height * 0.75
        self.yPositionCoinsImageView -= round(CGFloat(contentOfsetX) / 5 )
        UIView.animate(withDuration: 1.0, animations: {
            self.coinsImageView.frame = CGRect(x: Constants.xPositionCoinsImageView, y: self.yPositionCoinsImageView, width: Constants.widthCoinsImageView, height: Constants.heightCoinsImageView)
        })
    }
}

extension TutorialView {
    enum Constants {
        static let widthCoinsImageView: CGFloat = 150
        static let heightCoinsImageView: CGFloat = UIScreen.height * 0.54
        static let xPositionCoinsImageView: CGFloat = UIScreen.width * 0.66
    }
}
