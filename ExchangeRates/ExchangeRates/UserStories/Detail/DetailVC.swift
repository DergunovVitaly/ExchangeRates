//
//  DetailViewController.swift
//  ExchangeRates
//
//  Created by Mac on 25.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    let currencieArray = [CurrencyModel(name: "USD", description: "Долар США", bid: "24.8000", ask: "25.2500"),
                          CurrencyModel(name: "EUR", description: "Євро", bid: "27.5000", ask: "28.0000"),
                          CurrencyModel(name: "GBF", description: "Англійський Фунт Стерлінгів", bid: "31.6000", ask: "31.7450"),
                          CurrencyModel(name: "PLN", description: "Польський Злотий", bid: "6.3500", ask: "6.4700"),
                          CurrencyModel(name: "RUB", description: "Pocійський Рубль", bid: "0.3500", ask: "0.3900")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contenView = DetailView(array: currencieArray)
        view = contenView
        setNavigationController()
    }
    
    func setNavigationController(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(perfomAdd))
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.barTintColor = R.color.lightBlue()
        modalPresentationStyle = .fullScreen
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func perfomAdd() {
        self.navigationController!.pushViewController(BanksVC(), animated: true)
    }
    
}



