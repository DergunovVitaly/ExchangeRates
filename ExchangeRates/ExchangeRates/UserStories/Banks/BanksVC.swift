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
                let cityName = self.addValueForKeyOfDict(keyArray: cityId, dict: cityDict)
                let regionId = bank[0].organizations.map { $0.regionId }
                let regionDict = bank[0].regions
                let regionName = self.addValueForKeyOfDict(keyArray: regionId, dict: regionDict)
                self.contentView.getOrganizations(organizations: bank[0].organizations, regionName: regionName, cityName: cityName)
                self.contentView.bankTableView.reloadData()
            }
        }
    }
    
    func addValueForKeyOfDict(keyArray: [String], dict: [String : String]) -> [String] {
        var resultArray = [String]()
        for item in 0..<keyArray.count {
            resultArray.append(dict[keyArray[item]]!)
        }
        return resultArray
    }
    
    func setNavigationController() {
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
    func linkButtonAction() {
        
    }
    
    func locationButtonAction() {
        
    }
    
    func phoneButtonAction() {
        
    }
    
    func detailButtonAction() {
        let navigationViewController = DetailBankVC()
        navigationController?.pushViewController(navigationViewController, animated: true)
    }
}
