//
//  ButtonDetailViewController.swift
//  ExchangeRates
//
//  Created by Mac on 26.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class ButtonVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let contenView = ButtonView()
        view = contenView
        contenView.delegate = self
    }
}

extension ButtonVC: ButtonViewDelegate {
    func exitButtonAction() {
        self.present(DetailBankVC(), animated: false, completion: nil)
    }
    
    func linkButtonAction() {
         
    }
    
    func mapButtonAction() {
         
    }
    
    func callButtonAction() {
         
    }
}
