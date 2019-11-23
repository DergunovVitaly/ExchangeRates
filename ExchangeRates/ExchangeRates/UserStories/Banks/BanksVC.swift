//
//  BanksVC.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//
import UIKit

class BanksVC: UIViewController {
    
    var regionName: [String] = []
    var cityName: [String] = []
    var organizations: [Organization] = []
    var urlBankLogo: [String] = []
    
    private var searchFilteredBanksArray: [Organization] = []
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {
            return false
        }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    private let contentView = BanksView()
    private let detailView = DetailBankView()
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func loadView() {
        super.loadView()
        view = contentView
        title = Localizable.titleNameFirstView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.delegate = self
        setupSearchController()
        setNavigationController()
        
        Request.fetch { [unowned self] (bank) in
            
            DispatchQueue.main.async {
                
                let cityId = bank[0].organizations.map { $0.cityId }
                let cityDict = bank[0].cities
//                self.cityName = ExchangeRatesCustomFunc.compareArrayWithDictionaryKeys(keyArray: cityId, dict: cityDict)
                let regionId = bank[0].organizations.map { $0.regionId }
                let regionDict = bank[0].regions
//                self.regionName = ExchangeRatesCustomFunc.compareArrayWithDictionaryKeys(keyArray: regionId, dict: regionDict)
//                self.organizations = bank[0].organizations
                let oldID = bank[0].organizations.map { $0.oldId }
//                self.urlBankLogo = ExchangeRatesCustomFunc.gettingStringsArrayFromAn(array: oldID)
                var banksVM = BankViewModel(organization: bank[0].organizations, regionName: ExchangeRatesCustomFunc.compareArrayWithDictionaryKeys(keyArray: regionId, dict: regionDict), cityName: ExchangeRatesCustomFunc.compareArrayWithDictionaryKeys(keyArray: cityId, dict: cityDict), urlBankLogo: ExchangeRatesCustomFunc.gettingStringsArrayFromAn(array: oldID))
                if self.isFiltering {
                    self.contentView.update(organizations: self.searchFilteredBanksArray, regionName: self.regionName, cityName: self.cityName, url: self.urlBankLogo)
//                    self.contentView.bankTableView.reloadData()
                } else {
                    self.contentView.update(organizations: self.organizations, regionName: self.regionName, cityName: self.cityName, url: self.urlBankLogo)
//                    self.contentView.bankTableView.reloadData()
                }
            }
        }
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Щукати"
        navigationItem.searchController = searchController
        definesPresentationContext = true
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
        guard let indexPath = contentView.bankTableView.indexPath(for: cell) else { return }
        let navigationViewController = DetailBankVC(organizations: organizations[indexPath.row], regionName: regionName[indexPath.row], cityName: cityName[indexPath.row])
        navigationController?.pushViewController(navigationViewController, animated: true)
    }
    
    func linkButtonAction(cell: BankTableViewCell) {
        guard let indexPath = contentView.bankTableView.indexPath(for: cell) else { return }
        guard let url = URL(string: organizations[indexPath.row].link.deleteLastLettersAfter(character: "/")) else { return }
        let urlForBankWebView = url
        let webViewVC = SafariViewController(url: urlForBankWebView)
        self.present(webViewVC, animated: true, completion: nil)
    }
    
    func locationButtonAction() {
        
    }
    
    func phoneButtonAction() {
        
    }
}

extension BanksVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filtercontentForSeacrhText(searchController.searchBar.text!)
    }
    
    private func filtercontentForSeacrhText(_ searchText: String) {
        searchFilteredBanksArray = organizations.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        contentView.bankTableView.reloadData()
    }
}
