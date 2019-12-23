//
//  BanksTableViewCell.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import UIKit
import Kingfisher

class BankTableViewCell: UITableViewCell {
    
    var urlForImageBankLogo: String?
    private var currencyArray: [Currency] = []
    private var currencyName: [String] = []
    private var organizations: Organization?
    private let titleBankLabel = UILabel()
    private let bankLogo = UIImageView()
    private let cityNameLabel = UILabel()
    private let regionName = UILabel()
    private let phoneLabel = UILabel()
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
        layout.sectionInset = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
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
        self.cityNameLabel.text = cityName
        self.regionName.text = regionsName
        self.phoneLabel.text = organizations.phone
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
        
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.bottom.leading.trailing.equalToSuperview()
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
