//
//  TutorialVC.swift
//  ExchangeRates
//
//  Created by Mac on 06/10/2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation
import UIKit

class TutorialVC: UIViewController {
    
    private let contentView: TutorialView?
    private let tutorialViewArray = [CreateTutorialView(image: R.image.piggyBank(),
                                                        titleLabelText: Localizable.titleTutorialFirstSlide(),
                                                        descriptionLabelText: Localizable.descriptionTutorialFirstSlide()),
                                     CreateTutorialView(image: R.image.money(),
                                                        titleLabelText: Localizable.titleTutorialSecondSlide(),
                                                        descriptionLabelText: Localizable.descriptionTutorialSecondSlide()),
                                     CreateTutorialView(image: R.image.analysis(),
                                                        titleLabelText: Localizable.titleTutorialThirdSlide(),
                                                        descriptionLabelText: Localizable.descriptionTutorialThirdSlide())]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.contentView = TutorialView(tutorialView: tutorialViewArray)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        contentView?.delegate = self
        view = contentView
    }
}

extension TutorialVC: TutorialViewDelegate {
    func tapStartButtonEvent() {
        let navigation = UINavigationController(rootViewController: BanksVC())
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
}
