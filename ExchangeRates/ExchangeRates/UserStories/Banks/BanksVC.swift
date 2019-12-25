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
    private var filteredViewModel: [BankViewModel] = []
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
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
        
        setApperanceForNavBar()
        contentView.delegate = self
        setupSearchController()
        setNavigationController()
        
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
                self.contentView.update(viewModel: self.viewModelsArray)
                self.contentView.bankTableView.reloadData()
            }
        }
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.barTintColor = R.color.lightBlue()
        navigationController?.navigationBar.tintColor = .white
        if #available(iOS 13.0, *) {
            let smallConfiguration = UIImage.SymbolConfiguration(scale: .large)
            let smallSymbolImage = UIImage(systemName: "person.circle", withConfiguration: smallConfiguration)
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: smallSymbolImage, style: .done, target: self, action: #selector(share))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "person.circle"), style: .done, target: self, action: #selector(share))
        }
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        if #available(iOS 13.0, *) {
            searchController.searchBar.searchTextField.backgroundColor = .white
            searchController.searchBar.searchTextField.tintColor = R.color.lightBlue()
        } else {
            for textField in searchController.searchBar.subviews.first!.subviews where textField is UITextField {
                textField.subviews.first?.backgroundColor = .white
                textField.subviews.first?.layer.cornerRadius = 10.5
                textField.subviews.first?.layer.masksToBounds = true
                textField.tintColor = R.color.lightBlue()
            }
        }
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Localizable.find()
        definesPresentationContext = true
        navigationItem.searchController = searchController
    }
    
    @objc func share() {
        
    }
}

extension BanksVC: BanksViewDelegate {
    func detailButtonActionDidSelectRow(indexPath: IndexPath) {
        if searchController.isActive && !searchBarIsEmpty {
            let detailsBankVC = DetailBankVC(vm: filteredViewModel[indexPath.row])
            navigationController?.pushViewController(detailsBankVC, animated: true)
        } else {
            self.contentView.update(viewModel: self.viewModelsArray)
            let detailsBankVC = DetailBankVC(vm: viewModelsArray[indexPath.row])
            navigationController?.pushViewController(detailsBankVC, animated: true)
        }
    }
    
    
    func detailButtonAction(cell: BankTableViewCell) {
        guard let indexPath = contentView.bankTableView.indexPath(for: cell) else { return }
        if searchController.isActive && !searchBarIsEmpty {
            let detailsBankVC = DetailBankVC(vm: filteredViewModel[indexPath.row])
            navigationController?.pushViewController(detailsBankVC, animated: true)
        } else {
            self.contentView.update(viewModel: self.viewModelsArray)
            let detailsBankVC = DetailBankVC(vm: viewModelsArray[indexPath.row])
            navigationController?.pushViewController(detailsBankVC, animated: true)
        }
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
        if searchController.isActive && !searchBarIsEmpty {
            self.contentView.update(viewModel: self.filteredViewModel)
        } else {
            self.contentView.update(viewModel: self.viewModelsArray)
        }
        self.contentView.bankTableView.reloadData()
    }
}
