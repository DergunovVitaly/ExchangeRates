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
    private var organizations: Organization?
    private let backgroundViewCell = UIView()
    private let titleBankLabel = UILabel()
    private let bankLogo = UIImageView()
    private let collectionView: UICollectionView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: BankTableViewCell.collectionViewLayout())
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.minimumLineSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        return layout
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bankLogo.kf.setImage(with: URL(string: urlForImageBankLogo ?? ""))
        bankLogo.image = nil
    }
    
    func update(organizations: Organization, regionsName: String, cityName: String, urlForImageBankLogo: String) {
        self.titleBankLabel.text = organizations.title
        bankLogo.kf.setImage(with: URL(string: urlForImageBankLogo))
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        UIView.animate(withDuration: 0.2) {
            self.backgroundViewCell.transform = highlighted ? CGAffineTransform(scaleX: 0.95, y: 0.95) : CGAffineTransform.identity
            self.backgroundViewCell.backgroundColor = highlighted ? R.color.lightBlue()?.withAlphaComponent(0.5) : UIColor.white.withAlphaComponent(0.1)
            highlighted ? self.bankLogo.setIsHidden(true, animated: true) : self.bankLogo.setIsHidden(false, animated: true)
        }
    }
    
    private func setupLayout() {
        backgroundColor = .white
        selectionStyle = .none
        
        contentView.addSubview(backgroundViewCell)
        backgroundViewCell.layer.borderColor = R.color.lightBlue()?.cgColor
        backgroundViewCell.layer.borderWidth = 2
        backgroundViewCell.layer.cornerRadius = 10
        backgroundViewCell.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5))
        }
        
        backgroundViewCell.addSubview(titleBankLabel)
        titleBankLabel.font = R.font.helveticaNeue(size: 26)
        titleBankLabel.textColor = R.color.lightDark()
        titleBankLabel.numberOfLines = 0
        titleBankLabel.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(15)
            make.width.equalTo(200)
        }
        
        backgroundViewCell.addSubview(bankLogo)
        bankLogo.contentMode = .scaleAspectFit
        bankLogo.snp.makeConstraints { (make) in
            make.top.equalTo(titleBankLabel.snp.top)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        backgroundViewCell.addSubview(collectionView)
        collectionView.backgroundColor = .green
        collectionView.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
}
