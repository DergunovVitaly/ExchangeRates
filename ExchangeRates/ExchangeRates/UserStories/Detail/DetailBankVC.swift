//
//  DetailViewController.swift
//  ExchangeRates
//
//  Created by Mac on 25.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class DetailBankVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contenView = DetailBankView()
        view = contenView
        contenView.delegate = self
        setNavigationController()
    }
    
    func setNavigationController(){
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.barTintColor = R.color.lightBlue()
        modalPresentationStyle = .fullScreen
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: R.image.share(), style: .done, target: self, action: #selector(share))
    }
    
    @objc func share() {
        let vc = UIActivityViewController(activityItems: [view ?? UIView()], applicationActivities: [])
        present(vc, animated: true)
    }
    @objc func perfomAdd() {
        self.navigationController!.pushViewController(BanksVC(), animated: true)
    }
}

extension DetailBankVC: BankViewDelegatDelegate {
    func detailButtonAction() {
        let navigationViewController = ButtonVC()
        navigationViewController.modalPresentationStyle = .overCurrentContext
        navigationController?.pushViewController(navigationViewController, animated: false)
    }
}
