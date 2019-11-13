//
//  WebViewController.swift
//  ExchangeRates
//
//  Created by Mac on 11.11.2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import UIKit
import WebKit
import SafariServices
class WebViewController: SFSafariViewController {
    //TODO: add activity indicator
    private var bankWebView = WKWebView()
    private var urlBankWebView: URL
   
     init(url URL: URL) {
        self.urlBankWebView = URL
        super.init(url: self.urlBankWebView, configuration: WebViewController.safariConfiguration())
        delegate = self
    }
    
    static func safariConfiguration() -> Configuration {
        let safariConfiguration = SFSafariViewController.Configuration()
        safariConfiguration.barCollapsingEnabled = true
        safariConfiguration.entersReaderIfAvailable = true
        return safariConfiguration
    }
    
//    init(urlBankWebView: URL) {
//        self.urlBankWebView = urlBankWebView
//        super.init(nibName: nil, bundle: nil)
//         showActivityIndicatro()
//        bankWebView.uiDelegate = self
//        bankWebView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
//        let myRequest = URLRequest(url: urlBankWebView)
//
//
//        bankWebView.load(myRequest)
//        view = bankWebView
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}

extension WebViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
