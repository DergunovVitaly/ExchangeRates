//
//  BanksTableViewCell.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class BankTableViewCell: UITableViewCell {
    
    var urlForImageBankLogo: String?
    private var currencyArray: [Currency] = []
    private var currencyName: [String] = []
    private var organizations: Organization?
    private let titleBankLabel = UILabel()
    private let bankLogo = UIImageView()
    private let linkButton = UIButton()
    private let callButton = UIButton()
    private let locationButton = UIButton()
    private let bankDetailsButton = UIButton()

    private let collectionView: UICollectionView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: BankTableViewCell.collectionViewLayout())
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: 140, height: 55)
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 7,
                                           bottom: 0,
                                           right: 7)
        return layout
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bankLogo.kf.setImage(with: URL(string: urlForImageBankLogo ?? ""))
        bankLogo.image = nil
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        UIView.animate(withDuration: 0.2) {
            self.transform = highlighted ? CGAffineTransform(scaleX: 0.95, y: 0.95) : CGAffineTransform.identity
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10,
                                                                     left: 10,
                                                                     bottom: 10,
                                                                     right: 10))
    }
    
    func update(organizations: Organization, regionsName: String, cityName: String, urlForImageBankLogo: String) {
        self.titleBankLabel.text = organizations.title
        self.currencyArray = organizations.currencies.map { $0.value }
        self.currencyName = organizations.currencies.map { $0.key }
        bankLogo.kf.setImage(with: URL(string: urlForImageBankLogo))
        collectionView.reloadData()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(ExtangeRateCell.self, forCellWithReuseIdentifier: String(describing: ExtangeRateCell.self))
    }
    
    private func setupLayout() {
        backgroundColor = .white
        selectionStyle = .none
        
        contentView.layer.borderColor = R.color.lightBlue()?.cgColor
        contentView.layer.borderWidth = 3
        contentView.layer.cornerRadius = 10
        
        contentView.addSubview(titleBankLabel)
        titleBankLabel.font = R.font.helveticaNeue(size: 26)
        titleBankLabel.textColor = R.color.lightDark()
        titleBankLabel.numberOfLines = 0
        titleBankLabel.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(15)
            make.width.equalTo(200)
        }
    
        contentView.addSubview(bankLogo)
        bankLogo.contentMode = .scaleAspectFit
        bankLogo.snp.makeConstraints { (make) in
            make.top.equalTo(titleBankLabel.snp.top)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        let linkCallStackView = UIStackView(arrangedSubviews: [linkButton, callButton])
        linkButton.setImage(R.image.link(), for: .normal)
        callButton.setImage(R.image.phone(), for: .normal)
        linkCallStackView.axis = .horizontal
        linkCallStackView.alignment = .fill
        linkCallStackView.spacing = 20
        contentView.addSubview(linkCallStackView)
        linkCallStackView.snp.makeConstraints { (make) in
            make.top.equalTo(titleBankLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(CGSize(width: 108, height: 44))
        }
        
        
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        let locationDetailsStackView = UIStackView(arrangedSubviews: [locationButton, bankDetailsButton])
        locationButton.setImage(R.image.location(), for: .normal)
        bankDetailsButton.setImage(R.image.menu(), for: .normal)
        locationDetailsStackView.axis = .horizontal
        locationDetailsStackView.alignment = .fill
        locationDetailsStackView.spacing = 25
        contentView.addSubview(locationDetailsStackView)
        locationDetailsStackView.snp.makeConstraints { (make) in
            make.top.equalTo(linkCallStackView.snp.bottom).offset(25)
            make.leading.equalTo(linkCallStackView)
            make.bottom.equalTo(collectionView.snp.top)
        }
    }
}

extension BankTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currencyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ExtangeRateCell.self), for: indexPath) as? ExtangeRateCell else { return UICollectionViewCell() }
        cell.currencyNameLabel.text = currencyName[indexPath.row]
        cell.askLabel.text = currencyArray[indexPath.row].ask
        cell.bidLabel.text = currencyArray[indexPath.row].bid
        return cell
    }
}
