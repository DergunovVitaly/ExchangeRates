//
//  ButtonView.swift
//  ExchangeRates
//
//  Created by Mac on 26.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

protocol ButtonViewDelegate: class {
    func exitButtonAction()
    func linkButtonAction()
    func mapButtonAction()
    func callButtonAction()
}

class ExtraMenuDetailView: UIView {
    
    weak var delegate: ButtonViewDelegate?
    
    private let exitButton = UIButton()
    private let linkButton = UIButton()
    private let mapButton = UIButton()
    private let callButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .clear
        isOpaque = false
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        addSubview(exitButton)
        exitButton.setImage(R.image.quit(), for: .normal)
        exitButton.addTarget(self, action: #selector(exitButtonActionSelector), for: .touchUpInside)
        exitButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-45)
            make.width.height.equalTo(70)
        }
        
        addSubview(callButton)
        callButton.setImage(R.image.callButton(), for: .normal)
        callButton.addTarget(self, action: #selector(callButtonActionSelector), for: .touchUpInside)
        callButton.snp.makeConstraints { (make) in
            make.width.height.trailing.equalTo(exitButton)
            make.bottom.equalTo(exitButton).offset(-60)
        }
        
        addSubview(mapButton)
        mapButton.setImage(R.image.mapButton(), for: .normal)
        mapButton.addTarget(self, action: #selector(mapButtonActionSelector), for: .touchUpInside)
        mapButton.snp.makeConstraints { (make) in
            make.width.height.trailing.equalTo(callButton)
            make.bottom.equalTo(callButton).offset(-60)
        }
        
        addSubview(linkButton)
        linkButton.setImage(R.image.linkButton(), for: .normal)
        linkButton.addTarget(self, action: #selector(linkButtonActionSelector), for: .touchUpInside)
        linkButton.snp.makeConstraints { (make) in
            make.width.height.trailing.equalTo(mapButton)
            make.bottom.equalTo(mapButton).offset(-60)
        }
    }
    @objc func exitButtonActionSelector() {
        delegate?.exitButtonAction()
    }
    @objc func linkButtonActionSelector() {
        delegate?.linkButtonAction()
    }
    @objc func mapButtonActionSelector() {
        delegate?.mapButtonAction()
    }
    @objc func callButtonActionSelector() {
        delegate?.callButtonAction()
    }
}
