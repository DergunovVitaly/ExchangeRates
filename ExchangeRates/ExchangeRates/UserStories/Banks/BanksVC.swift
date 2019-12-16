//
//  BanksVC.swift
//  ExchangeRates
//
//  Created by Mac on 21.10.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//
import UIKit

class BanksVC: UIViewController {
    
    private var viewModelsArray: [BankViewModel] = []
    
    private let contentView = BanksView()
    private let detailView = DetailBankView()
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var filteredViewModel: [BankViewModel] = []
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return true
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
        title = Localizable.titleNameFirstView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.delegate = self
        setNavigationController()
        setupSearchController()
        
        Request.fetch { [unowned self] (bank) in
            DispatchQueue.main.async {
                let cityId = bank[0].organizations.map { $0.cityId }
                let cityDict = bank[0].cities
                let cityName = ExchangeRatesCustomFunc.compareArrayWithDictionaryKeys(keyArray: cityId, dict: cityDict)
                let regionId = bank[0].organizations.map { $0.regionId }
                let regionDict = bank[0].regions
                let regionName = ExchangeRatesCustomFunc.compareArrayWithDictionaryKeys(keyArray: regionId, dict: regionDict)
                let organizations = bank[0].organizations
                let oldID = bank[0].organizations.map { $0.oldId }
                let urlBankLogo = ExchangeRatesCustomFunc.gettingStringsArrayFromAn(array: oldID)
                for item in 0...bank[0].organizations.count - 1 {
                    self.viewModelsArray.append(BankViewModel(organization: organizations[item], regionName: regionName[item], cityName: cityName[item], urlBankLogo: urlBankLogo[item]))
                }
                if self.isFiltering {
                    self.contentView.update(vm: self.filteredViewModel)
                    self.contentView.bankTableView.reloadData()
                } else {
                    self.contentView.update(vm: self.viewModelsArray)
                    self.contentView.bankTableView.reloadData()
                }
            }
        }
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.barTintColor = R.color.lightBlue()
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.placeholder = Localizable.find()

    }
}

extension BanksVC: BanksViewDelegate {
    
    func detailButtonAction(cell: BankTableViewCell) {
        guard let indexPath = contentView.bankTableView.indexPath(for: cell) else { return }
        let navigationViewController = DetailBankVC(vm: viewModelsArray[indexPath.row])
        navigationController?.pushViewController(navigationViewController, animated: true)
    }
    
    func linkButtonAction(cell: BankTableViewCell) {
        guard let indexPath = contentView.bankTableView.indexPath(for: cell) else { return }
        guard let url = URL(string: viewModelsArray[indexPath.row].organization.link.deleteLastLettersAfter(character: "/")) else { return }
        let urlForBankWebView = url
        let safariVC = SafariViewController(url: urlForBankWebView)
        self.present(safariVC, animated: true, completion: nil)
    }
    
    func locationButtonAction() {
    }
    
    func phoneButtonAction() {
    }
}

extension BanksVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredViewModel = viewModelsArray.filter { $0.organization.title.lowercased().contains(searchText.lowercased())
        }
        self.contentView.bankTableView.reloadData()
    }
}
