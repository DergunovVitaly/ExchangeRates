//
//  DetailView.swift
//  ExchangeRates
//
//  Created by Mac on 25.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

protocol BankViewDelegatDelegate: class {
    func detailButtonAction()
}

class DetailBankView: UIView {
    
    private let detailTableView = UITableView()
    private let topTableViewCellLabel = UILabel()
    private let nameCurrentLabel = UILabel()
    private let actionCurrentLabel = UILabel()
    private let titleLabel = UILabel()
    private let bankLogo = UIImageView()
    private let detailButton = UIButton()
    private let contentBankScrollView = UIScrollView()
    private let linkBankLabel = UILabel()
    private let adressBankLabel = UILabel()
    private let numberTelephoneLabel = UILabel()
    
    weak var delegate: BankViewDelegatDelegate?
    
    init() {
        super.init(frame: .zero)
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: String(describing: DetailTableViewCell.self))
        detailTableView.delegate = self
        detailTableView.dataSource = self
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getOrganizations(organizations: Organization, regionName: String, cityName: String) {
        self.titleLabel.text = organizations.title
    }
    
    func setupLayout() {
        backgroundColor = .white
        
        
        addSubview(detailTableView)
        detailTableView.rowHeight = 70
        detailTableView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(200)
        }
        
        addSubview(topTableViewCellLabel)
        topTableViewCellLabel.backgroundColor = R.color.grayView()
        topTableViewCellLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(detailTableView.snp.top)
            make.leading.trailing.equalTo(detailTableView)
            make.height.equalTo(50)
        }
        
        topTableViewCellLabel.addSubview(nameCurrentLabel)
        nameCurrentLabel.text = Localizable.nameCurrent()
        nameCurrentLabel.font = R.font.helveticaNeue(size: 18)
        nameCurrentLabel.textColor = R.color.lightGrey()
        nameCurrentLabel.snp.makeConstraints { (make) in
            make.top.height.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(150)
        }
        
        topTableViewCellLabel.addSubview(actionCurrentLabel)
        actionCurrentLabel.text = Localizable.actionCurrent()
        actionCurrentLabel.font = R.font.helveticaNeue(size: 18)
        actionCurrentLabel.textColor = R.color.lightGrey()
        actionCurrentLabel.snp.makeConstraints { (make) in
            make.top.trailing.height.equalToSuperview()
            make.width.equalTo(170)
        }
        
        addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.font = R.font.helveticaNeue(size: 34)
        titleLabel.textColor = R.color.lightDark()
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(80)
            make.leading.trailing.equalToSuperview().offset(15)
        }
        
        addSubview(contentBankScrollView)
        contentBankScrollView.backgroundColor = .yellow
        contentBankScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(80)
            make.bottom.equalTo(topTableViewCellLabel.snp.top)
        }
        
        
        addSubview(bankLogo)
        
        addSubview(detailButton)
        detailButton.setImage(R.image.float(), for: .normal)
        detailButton.addTarget(self, action: #selector(setdetailButtonAction), for: .touchUpInside)
        detailButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-45)
            make.width.height.equalTo(70)
        }
    }
    @objc func setdetailButtonAction() {
        delegate?.detailButtonAction()
    }
}

extension DetailBankView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DetailTableViewCell()
        return cell
    }
}
