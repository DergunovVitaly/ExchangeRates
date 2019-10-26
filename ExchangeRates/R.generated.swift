//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try font.validate()
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 4 colors.
  struct color {
    /// Color `grayView`.
    static let grayView = Rswift.ColorResource(bundle: R.hostingBundle, name: "grayView")
    /// Color `lightBlue`.
    static let lightBlue = Rswift.ColorResource(bundle: R.hostingBundle, name: "lightBlue")
    /// Color `lightDark`.
    static let lightDark = Rswift.ColorResource(bundle: R.hostingBundle, name: "lightDark")
    /// Color `lightGrey`.
    static let lightGrey = Rswift.ColorResource(bundle: R.hostingBundle, name: "lightGrey")
    
    /// `UIColor(named: "grayView", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func grayView(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.grayView, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "lightBlue", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func lightBlue(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.lightBlue, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "lightDark", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func lightDark(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.lightDark, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "lightGrey", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func lightGrey(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.lightGrey, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 2 fonts.
  struct font: Rswift.Validatable {
    /// Font `HelveticaNeue-Bold`.
    static let helveticaNeueBold = Rswift.FontResource(fontName: "HelveticaNeue-Bold")
    /// Font `HelveticaNeue`.
    static let helveticaNeue = Rswift.FontResource(fontName: "HelveticaNeue")
    
    /// `UIFont(name: "HelveticaNeue", size: ...)`
    static func helveticaNeue(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: helveticaNeue, size: size)
    }
    
    /// `UIFont(name: "HelveticaNeue-Bold", size: ...)`
    static func helveticaNeueBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: helveticaNeueBold, size: size)
    }
    
    static func validate() throws {
      if R.font.helveticaNeue(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'HelveticaNeue' could not be loaded, is 'helveticaneue.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.helveticaNeueBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'HelveticaNeue-Bold' could not be loaded, is 'HelveticaNeueBold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 17 images.
  struct image {
    /// Image ` arrow-down`.
    static let arrowDown = Rswift.ImageResource(bundle: R.hostingBundle, name: " arrow-down")
    /// Image ` arrow-up`.
    static let arrowUp = Rswift.ImageResource(bundle: R.hostingBundle, name: " arrow-up")
    /// Image ` back`.
    static let back = Rswift.ImageResource(bundle: R.hostingBundle, name: " back")
    /// Image ` link`.
    static let link = Rswift.ImageResource(bundle: R.hostingBundle, name: " link")
    /// Image ` menu`.
    static let menu = Rswift.ImageResource(bundle: R.hostingBundle, name: " menu")
    /// Image ` phone`.
    static let phone = Rswift.ImageResource(bundle: R.hostingBundle, name: " phone")
    /// Image ` search`.
    static let search = Rswift.ImageResource(bundle: R.hostingBundle, name: " search")
    /// Image `alfa`.
    static let alfa = Rswift.ImageResource(bundle: R.hostingBundle, name: "alfa")
    /// Image `analysis`.
    static let analysis = Rswift.ImageResource(bundle: R.hostingBundle, name: "analysis")
    /// Image `black`.
    static let black = Rswift.ImageResource(bundle: R.hostingBundle, name: "black")
    /// Image `coins`.
    static let coins = Rswift.ImageResource(bundle: R.hostingBundle, name: "coins")
    /// Image `location`.
    static let location = Rswift.ImageResource(bundle: R.hostingBundle, name: "location")
    /// Image `money`.
    static let money = Rswift.ImageResource(bundle: R.hostingBundle, name: "money")
    /// Image `piggyBank`.
    static let piggyBank = Rswift.ImageResource(bundle: R.hostingBundle, name: "piggyBank")
    /// Image `privat`.
    static let privat = Rswift.ImageResource(bundle: R.hostingBundle, name: "privat")
    /// Image `vtb`.
    static let vtb = Rswift.ImageResource(bundle: R.hostingBundle, name: "vtb")
    /// Image `white`.
    static let white = Rswift.ImageResource(bundle: R.hostingBundle, name: "white")
    
    /// `UIImage(named: " arrow-down", bundle: ..., traitCollection: ...)`
    static func arrowDown(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.arrowDown, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: " arrow-up", bundle: ..., traitCollection: ...)`
    static func arrowUp(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.arrowUp, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: " back", bundle: ..., traitCollection: ...)`
    static func back(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.back, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: " link", bundle: ..., traitCollection: ...)`
    static func link(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.link, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: " menu", bundle: ..., traitCollection: ...)`
    static func menu(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.menu, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: " phone", bundle: ..., traitCollection: ...)`
    static func phone(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.phone, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: " search", bundle: ..., traitCollection: ...)`
    static func search(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.search, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "alfa", bundle: ..., traitCollection: ...)`
    static func alfa(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.alfa, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "analysis", bundle: ..., traitCollection: ...)`
    static func analysis(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.analysis, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "black", bundle: ..., traitCollection: ...)`
    static func black(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.black, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "coins", bundle: ..., traitCollection: ...)`
    static func coins(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.coins, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "location", bundle: ..., traitCollection: ...)`
    static func location(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.location, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "money", bundle: ..., traitCollection: ...)`
    static func money(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.money, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "piggyBank", bundle: ..., traitCollection: ...)`
    static func piggyBank(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.piggyBank, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "privat", bundle: ..., traitCollection: ...)`
    static func privat(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.privat, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "vtb", bundle: ..., traitCollection: ...)`
    static func vtb(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.vtb, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "white", bundle: ..., traitCollection: ...)`
    static func white(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.white, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 10 localization keys.
    struct localizable {
      /// en translation: Bank Informer
      /// 
      /// Locales: en
      static let titleNameFirstView = Rswift.StringResource(key: "titleNameFirstView", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Аналізуйте
      /// 
      /// Locales: en
      static let titleTutorialThirdSlide = Rswift.StringResource(key: "titleTutorialThirdSlide", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Заощаджуйте кошти
      /// 
      /// Locales: en
      static let titleTutorialFirstSlide = Rswift.StringResource(key: "titleTutorialFirstSlide", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Заробляйте
      /// 
      /// Locales: en
      static let titleTutorialSecondSlide = Rswift.StringResource(key: "titleTutorialSecondSlide", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Назва Валюти
      /// 
      /// Locales: en
      static let nameCurrent = Rswift.StringResource(key: "nameCurrent", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Отримайте вигідний відсоток з вигідним вкладом
      /// 
      /// Locales: en
      static let descriptionTutorialSecondSlide = Rswift.StringResource(key: "descriptionTutorialSecondSlide", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Переглядайте інформацію щодо банківських курсів та вибирайте оптимальний варіант
      /// 
      /// Locales: en
      static let descriptionTutorialFirstSlide = Rswift.StringResource(key: "descriptionTutorialFirstSlide", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Повна інформація про грошові курси та банки
      /// 
      /// Locales: en
      static let descriptionTutorialThirdSlide = Rswift.StringResource(key: "descriptionTutorialThirdSlide", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Покупка / Продаж
      /// 
      /// Locales: en
      static let actionCurrent = Rswift.StringResource(key: "actionCurrent", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: РОЗПОЧАТИ
      /// 
      /// Locales: en
      static let titleButton = Rswift.StringResource(key: "titleButton", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      
      /// en translation: Bank Informer
      /// 
      /// Locales: en
      static func titleNameFirstView(_: Void = ()) -> String {
        return NSLocalizedString("titleNameFirstView", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Аналізуйте
      /// 
      /// Locales: en
      static func titleTutorialThirdSlide(_: Void = ()) -> String {
        return NSLocalizedString("titleTutorialThirdSlide", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Заощаджуйте кошти
      /// 
      /// Locales: en
      static func titleTutorialFirstSlide(_: Void = ()) -> String {
        return NSLocalizedString("titleTutorialFirstSlide", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Заробляйте
      /// 
      /// Locales: en
      static func titleTutorialSecondSlide(_: Void = ()) -> String {
        return NSLocalizedString("titleTutorialSecondSlide", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Назва Валюти
      /// 
      /// Locales: en
      static func nameCurrent(_: Void = ()) -> String {
        return NSLocalizedString("nameCurrent", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Отримайте вигідний відсоток з вигідним вкладом
      /// 
      /// Locales: en
      static func descriptionTutorialSecondSlide(_: Void = ()) -> String {
        return NSLocalizedString("descriptionTutorialSecondSlide", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Переглядайте інформацію щодо банківських курсів та вибирайте оптимальний варіант
      /// 
      /// Locales: en
      static func descriptionTutorialFirstSlide(_: Void = ()) -> String {
        return NSLocalizedString("descriptionTutorialFirstSlide", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Повна інформація про грошові курси та банки
      /// 
      /// Locales: en
      static func descriptionTutorialThirdSlide(_: Void = ()) -> String {
        return NSLocalizedString("descriptionTutorialThirdSlide", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Покупка / Продаж
      /// 
      /// Locales: en
      static func actionCurrent(_: Void = ()) -> String {
        return NSLocalizedString("actionCurrent", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: РОЗПОЧАТИ
      /// 
      /// Locales: en
      static func titleButton(_: Void = ()) -> String {
        return NSLocalizedString("titleButton", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
