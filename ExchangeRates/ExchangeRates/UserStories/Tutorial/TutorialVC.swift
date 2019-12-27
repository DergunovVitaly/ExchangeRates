//
//  TutorialVC.swift
//  ExchangeRates
//
//  Created by Mac on 06/10/2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import Foundation
import UIKit

enum Tutorial: CaseIterable {
    case save
    case earn
    case analyze
    
    var title: String {
        switch self {
        case .save:
            return Localizable.titleTutorialFirstSlide()
        case .earn:
            return Localizable.titleTutorialSecondSlide()
        case .analyze:
            return Localizable.titleTutorialThirdSlide()
        }
    }
    
    var details: String {
        switch self {
        case .save:
            return Localizable.descriptionTutorialFirstSlide()
        case .earn:
            return Localizable.descriptionTutorialSecondSlide()
        case .analyze:
            return Localizable.descriptionTutorialThirdSlide()
        }
    }
    
    var logo: UIImage {
        switch self {
        case .save:
            return R.image.piggyBank() ?? UIImage()
        case .earn:
            return R.image.money() ?? UIImage()
        case .analyze:
            return R.image.analysis() ?? UIImage()
        }
    }
}

class TutorialVC: UIViewController {
    
    private let contentView: TutorialView?
    private let tutorialViewArray: [CreateTutorialView]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        tutorialViewArray = Tutorial.allCases.map { CreateTutorialView(image: $0.logo,
                                                                       titleLabelText: $0.title,
                                                                       descriptionLabelText: $0.details) }
        self.contentView = TutorialView(tutorialView: tutorialViewArray)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        navigationController?.setNavigationBarHidden(true, animated: true)
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
