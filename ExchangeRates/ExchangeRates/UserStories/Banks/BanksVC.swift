//
//  BanksVC.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//
import UIKit

class BanksVC: UIViewController {
    
    private let contentView = BanksView()
    var indexPath: IndexPath?
    override func loadView() {
        super.loadView()
        contentView.delegate = self
        view = contentView
        title = Localizable.titleNameFirstView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController()
        DispatchQueue.main.async {
            Request.fetch { (bank) in
                let cityId = bank[0].organizations.map { $0.cityId }
                let cityDict = bank[0].cities
                let cityName = MyFavoriteFunc.compareArrayWithDictionaryKeys(keyArray: cityId, dict: cityDict)
                let regionId = bank[0].organizations.map { $0.regionId }
                let regionDict = bank[0].regions
                let regionName = MyFavoriteFunc.compareArrayWithDictionaryKeys(keyArray: regionId, dict: regionDict)
                self.contentView.getOrganizations(organizations: bank[0].organizations, regionName: regionName, cityName: cityName)
                self.contentView.bankTableView.reloadData()
            }
        }
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.barTintColor = R.color.lightBlue()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButton))
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func searchButton() {
        print("work")
    }
}

extension BanksVC: BanksViewDelegate {
    func detailButtonAction(cell: BankTableViewCell) {
        indexPath = contentView.bankTableView.indexPath(for: cell)
        let navigationViewController = DetailBankVC()
        navigationController?.pushViewController(navigationViewController, animated: true)
    }
    
    func linkButtonAction() {
        
    }
    
    func locationButtonAction() {
        
    }
    
    func phoneButtonAction() {
        
    }
}
