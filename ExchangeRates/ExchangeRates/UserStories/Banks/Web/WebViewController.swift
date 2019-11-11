//
//  WebViewController.swift
//  ExchangeRates
//
//  Created by Mac on 11.11.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    private var bankWebView = WKWebView()
    private var urlBankWebView: URL
    
    init(urlBankWebView: URL) {
        self.urlBankWebView = urlBankWebView
        super.init(nibName: nil, bundle: nil)
        bankWebView.uiDelegate = self
        bankWebView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        let myRequest = URLRequest(url: urlBankWebView)
        bankWebView.load(myRequest)
        view = bankWebView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
