//
//  TutorialVC.swift
//  ExchangeRates
//
//  Created by Mac on 06/10/2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Foundation
import UIKit

class TutorialVC: UIViewController, TutorialViewDelegate {
    
    private let tutorialViewArray = [CreateTutorialView(frame: .zero,
                                                        image: R.image.piggyBank(),
                                                        titleLabelText: Localizable.titleTutorialFirstSlide(),
                                                        descriptionLabelText: Localizable.descriptionTutorialFirstSlide()),
                                     CreateTutorialView(frame: .zero,
                                                        image: R.image.money(),
                                                        titleLabelText: Localizable.titleTutorialSecondSlide(),
                                                        descriptionLabelText: Localizable.descriptionTutorialSecondSlide()),
                                     CreateTutorialView(frame: .zero,
                                                        image: R.image.analysis(),
                                                        titleLabelText: Localizable.titleTutorialThirdSlide(),
                                                        descriptionLabelText: Localizable.descriptionTutorialThirdSlide())]
    
    override func loadView() {
        let contentView = TutorialView(frame: .zero, imageArray: tutorialViewArray)
        contentView.delegate = self
        view = contentView
    }
    
    func startButtonAction() {
        let navigation = UINavigationController(rootViewController: BanksVC())
        navigation.navigationBar.backgroundColor = R.color.lightBlue()
        self.show(navigation, sender: true)
    }
}
