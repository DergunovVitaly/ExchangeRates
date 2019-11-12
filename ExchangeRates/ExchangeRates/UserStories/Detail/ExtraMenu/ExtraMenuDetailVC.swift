//
//  ButtonDetailViewController.swift
//  ExchangeRates
//
//  Created by Mac on 26.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class ExtraMenuDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let contenView = ExtraMenuDetailView()
        view = contenView
        contenView.delegate = self
    }
}

extension ExtraMenuDetailVC: ButtonViewDelegate {
    func exitButtonAction() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func linkButtonAction() {
         
    }
    
    func mapButtonAction() {
         
    }
    
    func callButtonAction() {
         
    }
}