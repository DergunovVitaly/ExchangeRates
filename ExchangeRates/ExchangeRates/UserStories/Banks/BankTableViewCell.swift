//
//  BanksTableViewCell.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import UIKit
import Kingfisher

protocol BanksTableViewCellDelegate: class {
    func linkButtonAction(cell: BankTableViewCell)
    func locationButtonAction()
    func phoneButtonAction()
    func detailButtonAction(cell: BankTableViewCell)
}

class BankTableViewCell: UITableViewCell {
    
    weak var delegate: BanksTableViewCellDelegate?
    
    var urlForImageBankLogo: String?
    private var organizations: Organization?
    private var regionsName: String?
    private var cityName: String?
    private let backgroundViewCell = UIView()
    private let titleBankLabel = UILabel()
    private let bankLogo = UIImageView()
    private let nameCityLabel = UILabel()
    private let phoneLabel = UILabel()
    private let adressLabel = UILabel()
    private let nameRegionsLabel = UILabel()
    private let barStackView = UIStackView()
    private let linkButton = UIButton()
    private let locationButton = UIButton()
    private let phoneButton = UIButton()
    private let detailButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bankLogo.kf.setImage(with: URL(string: urlForImageBankLogo ?? ""))
        bankLogo.image = nil
    }
    
    func update(organizations: Organization, regionsName: String, cityName: String, urlForImageBankLogo: String) {
        self.nameRegionsLabel.text = regionsName
        if self.nameRegionsLabel.text == cityName {
            self.nameRegionsLabel.text = regionsName.add(postfix: Localizable.longNameCountry())
        }
        self.nameCityLabel.text = cityName.add(prefix: Localizable.titleShortCityName())
        self.titleBankLabel.text = organizations.title
        self.phoneLabel.text = organizations.phone.formatPhoneNumber().add(prefix: Localizable.titlePhoneShortNumber())
        self.adressLabel.text = organizations.address.add(prefix: Localizable.titleAdressBank())
        bankLogo.kf.setImage(with: URL(string: urlForImageBankLogo))
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
        
        backgroundViewCell.addSubview(nameRegionsLabel)
        nameRegionsLabel.textColor = R.color.lightGrey()
        nameRegionsLabel.font = R.font.helveticaNeue(size: 20)
        nameRegionsLabel.numberOfLines = 0
        nameRegionsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleBankLabel.snp.bottom).offset(25)
            make.leading.equalTo(titleBankLabel)
            make.trailing.equalToSuperview().inset(115)
        }
        
        backgroundViewCell.addSubview(nameCityLabel)
        nameCityLabel.textColor = R.color.lightGrey()
        nameCityLabel.font = R.font.helveticaNeue(size: 20)
        nameCityLabel.numberOfLines = 0
        nameCityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameRegionsLabel.snp.bottom).offset(10)
            make.leading.equalTo(nameRegionsLabel)
            make.width.equalTo(nameRegionsLabel)
            make.bottom.equalToSuperview().offset(-50)
        }
        
        backgroundViewCell.addSubview(bankLogo)
        bankLogo.contentMode = .scaleAspectFit
        bankLogo.snp.makeConstraints { (make) in
            make.top.equalTo(titleBankLabel)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        backgroundViewCell.addSubview(phoneLabel)
        phoneLabel.numberOfLines = 0
        phoneLabel.textAlignment = .right
        phoneLabel.textColor = R.color.lightGrey()
        phoneLabel.font = R.font.helveticaNeue(size: 15)
        phoneLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(bankLogo.snp.bottom).offset(10)
        }
        
        backgroundViewCell.addSubview(adressLabel)
        adressLabel.textAlignment = .right
        adressLabel.numberOfLines = 0
        adressLabel.textColor = R.color.lightGrey()
        adressLabel.font = R.font.helveticaNeue(size: 15)
        adressLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(phoneLabel)
            make.top.equalTo(phoneLabel.snp.bottom)
            make.width.equalTo(contentView.bounds.width / 2)
            make.bottom.equalToSuperview().offset(-50)
        }
        
        backgroundViewCell.addSubview(barStackView)
        barStackView.contentMode = .scaleToFill
        barStackView.axis = .horizontal
        barStackView.spacing = 10
        barStackView.isLayoutMarginsRelativeArrangement = true
        barStackView.layoutMargins = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
        barStackView.addBackground(color: R.color.grayView() ?? UIColor())
        barStackView.distribution = .equalSpacing
        barStackView.alignment = .center
        barStackView.snp.makeConstraints { (make) in
            make.height.equalTo(44)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        barStackView.addArrangedSubview(linkButton)
        linkButton.setImage(R.image.link(), for: .normal)
        linkButton.imageView?.contentMode = .scaleAspectFit
        
        barStackView.addArrangedSubview(locationButton)
        locationButton.imageView?.contentMode = .scaleAspectFit
        locationButton.setImage(R.image.location(), for: .normal)
        
        barStackView.addArrangedSubview(phoneButton)
        phoneButton.imageView?.contentMode = .scaleAspectFit
        phoneButton.setImage(R.image.phone(), for: .normal)
        
        barStackView.addArrangedSubview(detailButton)
        detailButton.imageView?.contentMode = .scaleAspectFit
        detailButton.setImage(R.image.menu(), for: .normal)
        detailButton.snp.makeConstraints { (make) in
            make.width.equalTo(40)
        }
        
        linkButton.addTargetClosure { [unowned self] (btn) in
            self.delegate?.linkButtonAction(cell: self)
        }
        
        locationButton.addTargetClosure { [unowned self] (btn) in
            self.delegate?.locationButtonAction()
        }
        
        phoneButton.addTargetClosure { [unowned self] (btn) in
            self.delegate?.phoneButtonAction()
        }
        
        detailButton.addTargetClosure { [unowned self] (btn) in
            self.delegate?.detailButtonAction(cell: self)
        }
    }
}
