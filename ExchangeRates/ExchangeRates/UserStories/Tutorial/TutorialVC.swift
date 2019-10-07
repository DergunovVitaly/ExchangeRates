//
//  TutorialVC.swift
//  ExchangeRates
//
//  Created by Mac on 06/10/2019.
//  Copyright © 2019 Denis Melnikov. All rights reserved.
//

import Foundation
import UIKit

class TutorialVC: UIViewController {
    
    private let button = UIButton()
    private let tutorialViewArray = [CreateTutorialView(frame: .zero,
                                                        image: R.image.piggyBank(),
                                                        titleLabelText: Localizable.titleTutorialFirstSlide(),
                                                        descriptionLabelText: Localizable.descriptionTutorialFirstSlide()),
                                     CreateTutorialView(frame: .zero, image: R.image.money(), titleLabelText: Localizable.titleTutorialSecondSlide(), descriptionLabelText: Localizable.descriptionTutorialSecondSlide()),
                                     CreateTutorialView(frame: .zero, image: R.image.analysis(), titleLabelText: Localizable.titleTutorialThirdSlide(), descriptionLabelText: Localizable.descriptionTutorialThirdSlide())]
    
    override func loadView() {
        let contentView = TutorialView(frame: .zero, imageArray: tutorialViewArray)
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
     //  setButton()
        }
    // TODO: Move to View
        func setButton() {
            self.button.backgroundColor = R.color.lightBlue()
            self.button.titleLabel?.font = .boldSystemFont(ofSize: 20)
            self.button.setTitle(Localizable.titleButton(), for: .normal)
            self.button.layer.cornerRadius = 30
            button.snp.makeConstraints { (make) in
                make.width.equalTo(250)
                make.height.equalTo(60)
                // TODO: no big numbers
                make.bottom.equalToSuperview().offset(-60)
                make.centerX.equalToSuperview()
        }
    }
}
