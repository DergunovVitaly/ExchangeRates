//
//  SafariViewController.swift
//  ExchangeRates
//
//  Created by Mac on 11.11.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import UIKit
import WebKit
import SafariServices
class SafariViewController: SFSafariViewController {
    //TODO: add activity indicator
    private var bankWebView = WKWebView()
    private var urlBankWebView: URL
   
     init(url URL: URL) {
        self.urlBankWebView = URL
        super.init(url: self.urlBankWebView, configuration: SafariViewController.safariConfiguration())
        delegate = self
    }
    
    static func safariConfiguration() -> Configuration {
        let safariConfiguration = SFSafariViewController.Configuration()
        safariConfiguration.barCollapsingEnabled = true
        safariConfiguration.entersReaderIfAvailable = true
        return safariConfiguration
    }
}

extension SafariViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
