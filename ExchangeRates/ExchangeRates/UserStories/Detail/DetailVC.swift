//
//  DetailViewController.swift
//  ExchangeRates
//
//  Created by Mac on 25.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    let currencieArray = [CurrencyModel(name: "USD", description: "Долар США"), CurrencyModel(name: "EUR", description: "Євро"), CurrencyModel(name: "GBF", description: "Англійський Фунт Стерлінгів"), CurrencyModel(name: "PLN", description: "Польський Злотий"), CurrencyModel(name: "RUB", description: "Pocійський Рубль")]
    
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



