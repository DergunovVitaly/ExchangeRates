//
//  DetailView.swift
//  ExchangeRates
//
//  Created by Mac on 25.10.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit

class DetailView: UIView {

    let detailTableView = UITableView()
    let topTableViewCellLabel = UILabel()
    private var currencyArray : [CurrencyModel]
    
    init(array: [CurrencyModel]) {
        self.currencyArray = array
        super.init(frame: .zero)
        setupLayout()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(detailTableView)
        //detailTableView.separatorStyle = .none
        //detailTableView.allowsSelection = false
        //detailTableView.showsVerticalScrollIndicator = false
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "cellDetail")
        detailTableView.backgroundColor = backgroundColor
        detailTableView.rowHeight = 70
        detailTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(400)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension DetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currencyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DetailTableViewCell(currencyModel: currencyArray[indexPath.row])
        return cell
    }
    
    
}
