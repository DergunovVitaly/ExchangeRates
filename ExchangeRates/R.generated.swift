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
  
  /// This `R.color` struct is generated, and contains static references to 2 colors.
  struct color {
    /// Color `lightBlue`.
    static let lightBlue = Rswift.ColorResource(bundle: R.hostingBundle, name: "lightBlue")
    /// Color `lightGrey`.
    static let lightGrey = Rswift.ColorResource(bundle: R.hostingBundle, name: "lightGrey")
    
    /// `UIColor(named: "lightBlue", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func lightBlue(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.lightBlue, compatibleWith: traitCollection)
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
  
  /// This `R.image` struct is generated, and contains static references to 4 images.
  struct image {
    /// Image `analysis`.
    static let analysis = Rswift.ImageResource(bundle: R.hostingBundle, name: "analysis")
    /// Image `coins`.
    static let coins = Rswift.ImageResource(bundle: R.hostingBundle, name: "coins")
    /// Image `money`.
    static let money = Rswift.ImageResource(bundle: R.hostingBundle, name: "money")
    /// Image `piggyBank`.
    static let piggyBank = Rswift.ImageResource(bundle: R.hostingBundle, name: "piggyBank")
    
    /// `UIImage(named: "analysis", bundle: ..., traitCollection: ...)`
    static func analysis(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.analysis, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "coins", bundle: ..., traitCollection: ...)`
    static func coins(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.coins, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "money", bundle: ..., traitCollection: ...)`
    static func money(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.money, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "piggyBank", bundle: ..., traitCollection: ...)`
    static func piggyBank(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.piggyBank, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 7 localization keys.
    struct localizable {
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
      /// en translation: РОЗПОЧАТИ
      /// 
      /// Locales: en
      static let titleButton = Rswift.StringResource(key: "titleButton", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      
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
      try main.validate()
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
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = TutorialVC
      
      let bundle = R.hostingBundle
      let name = "Main"
      
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
