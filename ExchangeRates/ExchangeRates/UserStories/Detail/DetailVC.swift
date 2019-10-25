//
//  DetailViewController.swift
//  ExchangeRates
//
//  Created by Mac on 25.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
    }
    
    func setNavigationController(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(perfomAdd))
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.barTintColor = R.color.lightBlue()
        modalPresentationStyle = .fullScreen
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func perfomAdd() {
        self.navigationController!.pushViewController(BanksVC(), animated: true)
    }
    
}



