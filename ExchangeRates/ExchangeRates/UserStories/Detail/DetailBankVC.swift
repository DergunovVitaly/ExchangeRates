//
//  DetailViewController.swift
//  ExchangeRates
//
//  Created by Mac on 25.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class DetailBankVC: UIViewController {
    
    private let contenView = DetailBankView()
    private let vm: BankViewModel
    
    init(vm: BankViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setApperanceForNavBar()
        contenView.delegate = self
        setNavigationController()
        
        contenView.getOrganizations(vm: vm)
    }
    
    func setNavigationController(){
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.barTintColor = R.color.lightBlue()
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
    func tapPhoneNumberLabelEvent(number: String) {
        number.makeACall()
    }
    
    func tapAddressLabelEvent(address: String) {
         self.navigationController?.pushViewController(LocationViewController(), animated: true)
    }
    
    func tapLinkLabelEvent(url: URL) {
        self.navigationController?.present(SafariViewController(url: url), animated: true, completion: nil)
    }
    
    func detailButtonAction() {
        let navigationViewController = ExtraMenuDetailVC()
        navigationController?.pushViewController(navigationViewController, animated: false)
    }
}
