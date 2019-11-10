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
    private let descriptionLabel = UILabel()
    private let titleLabel = UILabel()
    private let bankLogo = UIImageView()
    private let detailButton = UIButton()
    
    weak var delegate: BankViewDelegatDelegate?

    
    init() {
        super.init(frame: .zero)
        detailTableView.delegate = self
        detailTableView.dataSource = self
        setupLayout()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getOrganizations(organizations: Organization, regionName: String, cityName: String) {
        self.nameCurrentLabel.text = organizations.title
//           self.regionNamesArray = regionName
//           self.cityNamesArray = cityName
       }
    
    func setupLayout() {
        
        addSubview(detailTableView)
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: String(describing: DetailTableViewCell.self))
        detailTableView.rowHeight = 70
        detailTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(450)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        addSubview(topTableViewCellLabel)
        topTableViewCellLabel.backgroundColor = R.color.grayView()
        topTableViewCellLabel.snp.makeConstraints { (make) in
            make.top.equalTo(detailTableView).offset(-50)
            make.width.equalTo(detailTableView)
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
        
        addSubview(descriptionLabel)
        descriptionLabel.backgroundColor = .red
        descriptionLabel.snp.makeConstraints { (make) in
            make.width.equalTo(230)
            make.height.equalTo(280)
            make.bottom.equalTo(topTableViewCellLabel).offset(-50)
            make.leading.equalToSuperview().offset(15)
        }
        
        addSubview(titleLabel)
        titleLabel.backgroundColor = .green
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(68)
            make.leading.width.equalTo(descriptionLabel)
            make.height.equalTo(50)
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
