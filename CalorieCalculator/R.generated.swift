//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
  struct segue {
    /// This struct is generated for `HomeViewController`, and contains static references to 1 segues.
    struct homeViewController {
      /// Segue identifier `segue`.
      static let segue: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, HomeViewController, ActivityListViewController> = Rswift.StoryboardSegueIdentifier(identifier: "segue")

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `segue`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func segue(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, HomeViewController, ActivityListViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.homeViewController.segue, segue: segue)
      }
      #endif

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `Podfile`.
    static let podfile = Rswift.FileResource(bundle: R.hostingBundle, name: "Podfile", pathExtension: "")

    /// `bundle.url(forResource: "Podfile", withExtension: "")`
    static func podfile(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.podfile
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Main"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 2 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 16 localization keys.
    struct localizable {
      /// en translation: Activity: %@ with %@ calories
      ///
      /// Locales: en, uk
      static let detailSelected = Rswift.StringResource(key: "Detail.selected", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: Age
      ///
      /// Locales: en, uk
      static let calculatorAgeLabel = Rswift.StringResource(key: "Calculator.ageLabel", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: Calculate
      ///
      /// Locales: en, uk
      static let calculatorCalculateButton = Rswift.StringResource(key: "Calculator.calculateButton", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: Clear
      ///
      /// Locales: en, uk
      static let calculatorClearButton = Rswift.StringResource(key: "Calculator.clearButton", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: Female
      ///
      /// Locales: en, uk
      static let genderFamele = Rswift.StringResource(key: "Gender.famele", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: Height
      ///
      /// Locales: en, uk
      static let calculatorHeightLabel = Rswift.StringResource(key: "Calculator.heightLabel", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: High
      ///
      /// Locales: en, uk
      static let activityHigh = Rswift.StringResource(key: "Activity.high", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: Low
      ///
      /// Locales: en, uk
      static let activityLow = Rswift.StringResource(key: "Activity.low", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: Male
      ///
      /// Locales: en, uk
      static let genderMale = Rswift.StringResource(key: "Gender.male", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: Medium
      ///
      /// Locales: en, uk
      static let activityMedium = Rswift.StringResource(key: "Activity.medium", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: No selected activity
      ///
      /// Locales: en, uk
      static let detailNoSelected = Rswift.StringResource(key: "Detail.noSelected", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: None
      ///
      /// Locales: en, uk
      static let activityNone = Rswift.StringResource(key: "Activity.none", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: Physical Activity
      ///
      /// Locales: en, uk
      static let calculatorActivityLabel = Rswift.StringResource(key: "Calculator.activityLabel", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: Show detail
      ///
      /// Locales: en, uk
      static let alertShowDetail = Rswift.StringResource(key: "Alert.showDetail", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: Weight
      ///
      /// Locales: en, uk
      static let calculatorWeightLabel = Rswift.StringResource(key: "Calculator.weightLabel", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)
      /// en translation: Your result
      ///
      /// Locales: en, uk
      static let alertResult = Rswift.StringResource(key: "Alert.result", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "uk"], comment: nil)

      /// en translation: Activity: %@ with %@ calories
      ///
      /// Locales: en, uk
      static func detailSelected(_ value1: String, _ value2: String, preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          let format = NSLocalizedString("Detail.selected", bundle: hostingBundle, comment: "")
          return String(format: format, locale: applicationLocale, value1, value2)
        }

        guard let (locale, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Detail.selected"
        }

        let format = NSLocalizedString("Detail.selected", bundle: bundle, comment: "")
        return String(format: format, locale: locale, value1, value2)
      }

      /// en translation: Age
      ///
      /// Locales: en, uk
      static func calculatorAgeLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Calculator.ageLabel", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Calculator.ageLabel"
        }

        return NSLocalizedString("Calculator.ageLabel", bundle: bundle, comment: "")
      }

      /// en translation: Calculate
      ///
      /// Locales: en, uk
      static func calculatorCalculateButton(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Calculator.calculateButton", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Calculator.calculateButton"
        }

        return NSLocalizedString("Calculator.calculateButton", bundle: bundle, comment: "")
      }

      /// en translation: Clear
      ///
      /// Locales: en, uk
      static func calculatorClearButton(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Calculator.clearButton", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Calculator.clearButton"
        }

        return NSLocalizedString("Calculator.clearButton", bundle: bundle, comment: "")
      }

      /// en translation: Female
      ///
      /// Locales: en, uk
      static func genderFamele(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Gender.famele", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Gender.famele"
        }

        return NSLocalizedString("Gender.famele", bundle: bundle, comment: "")
      }

      /// en translation: Height
      ///
      /// Locales: en, uk
      static func calculatorHeightLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Calculator.heightLabel", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Calculator.heightLabel"
        }

        return NSLocalizedString("Calculator.heightLabel", bundle: bundle, comment: "")
      }

      /// en translation: High
      ///
      /// Locales: en, uk
      static func activityHigh(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Activity.high", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Activity.high"
        }

        return NSLocalizedString("Activity.high", bundle: bundle, comment: "")
      }

      /// en translation: Low
      ///
      /// Locales: en, uk
      static func activityLow(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Activity.low", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Activity.low"
        }

        return NSLocalizedString("Activity.low", bundle: bundle, comment: "")
      }

      /// en translation: Male
      ///
      /// Locales: en, uk
      static func genderMale(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Gender.male", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Gender.male"
        }

        return NSLocalizedString("Gender.male", bundle: bundle, comment: "")
      }

      /// en translation: Medium
      ///
      /// Locales: en, uk
      static func activityMedium(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Activity.medium", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Activity.medium"
        }

        return NSLocalizedString("Activity.medium", bundle: bundle, comment: "")
      }

      /// en translation: No selected activity
      ///
      /// Locales: en, uk
      static func detailNoSelected(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Detail.noSelected", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Detail.noSelected"
        }

        return NSLocalizedString("Detail.noSelected", bundle: bundle, comment: "")
      }

      /// en translation: None
      ///
      /// Locales: en, uk
      static func activityNone(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Activity.none", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Activity.none"
        }

        return NSLocalizedString("Activity.none", bundle: bundle, comment: "")
      }

      /// en translation: Physical Activity
      ///
      /// Locales: en, uk
      static func calculatorActivityLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Calculator.activityLabel", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Calculator.activityLabel"
        }

        return NSLocalizedString("Calculator.activityLabel", bundle: bundle, comment: "")
      }

      /// en translation: Show detail
      ///
      /// Locales: en, uk
      static func alertShowDetail(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Alert.showDetail", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Alert.showDetail"
        }

        return NSLocalizedString("Alert.showDetail", bundle: bundle, comment: "")
      }

      /// en translation: Weight
      ///
      /// Locales: en, uk
      static func calculatorWeightLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Calculator.weightLabel", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Calculator.weightLabel"
        }

        return NSLocalizedString("Calculator.weightLabel", bundle: bundle, comment: "")
      }

      /// en translation: Your result
      ///
      /// Locales: en, uk
      static func alertResult(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Alert.result", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Alert.result"
        }

        return NSLocalizedString("Alert.result", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.main` struct is generated, and contains static references to 11 localization keys.
    struct main {
      /// uk translation: Age
      ///
      /// Locales: uk
      static let gorEpG8VText = Rswift.StringResource(key: "gor-ep-g8V.text", tableName: "Main", bundle: R.hostingBundle, locales: ["uk"], comment: nil)
      /// uk translation: Button
      ///
      /// Locales: uk
      static let iTYUEUORNormalTitle = Rswift.StringResource(key: "iTY-uE-UOR.normalTitle", tableName: "Main", bundle: R.hostingBundle, locales: ["uk"], comment: nil)
      /// uk translation: Button
      ///
      /// Locales: uk
      static let lfeR9He5NormalTitle = Rswift.StringResource(key: "Lfe-r9-he5.normalTitle", tableName: "Main", bundle: R.hostingBundle, locales: ["uk"], comment: nil)
      /// uk translation: Calculate
      ///
      /// Locales: uk
      static let lfeR9He5ConfigurationTitle = Rswift.StringResource(key: "Lfe-r9-he5.configuration.title", tableName: "Main", bundle: R.hostingBundle, locales: ["uk"], comment: nil)
      /// uk translation: Clear
      ///
      /// Locales: uk
      static let iTYUEUORConfigurationTitle = Rswift.StringResource(key: "iTY-uE-UOR.configuration.title", tableName: "Main", bundle: R.hostingBundle, locales: ["uk"], comment: nil)
      /// uk translation: First
      ///
      /// Locales: uk
      static let bzP5gO2eSegmentTitles0 = Rswift.StringResource(key: "bzP-5g-O2e.segmentTitles[0]", tableName: "Main", bundle: R.hostingBundle, locales: ["uk"], comment: nil)
      /// uk translation: Height
      ///
      /// Locales: uk
      static let t09QL7gCText = Rswift.StringResource(key: "T09-qL-7gC.text", tableName: "Main", bundle: R.hostingBundle, locales: ["uk"], comment: nil)
      /// uk translation: Label
      ///
      /// Locales: uk
      static let c3Kz3WhText = Rswift.StringResource(key: "4C3-Kz-3Wh.text", tableName: "Main", bundle: R.hostingBundle, locales: ["uk"], comment: nil)
      /// uk translation: Physical Activity
      ///
      /// Locales: uk
      static let jGWsMNcText = Rswift.StringResource(key: "9jG-ws-mNc.text", tableName: "Main", bundle: R.hostingBundle, locales: ["uk"], comment: nil)
      /// uk translation: Second
      ///
      /// Locales: uk
      static let bzP5gO2eSegmentTitles1 = Rswift.StringResource(key: "bzP-5g-O2e.segmentTitles[1]", tableName: "Main", bundle: R.hostingBundle, locales: ["uk"], comment: nil)
      /// uk translation: Weight
      ///
      /// Locales: uk
      static let zZfGyClRText = Rswift.StringResource(key: "ZZf-gy-clR.text", tableName: "Main", bundle: R.hostingBundle, locales: ["uk"], comment: nil)

      /// uk translation: Age
      ///
      /// Locales: uk
      static func gorEpG8VText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("gor-ep-g8V.text", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "gor-ep-g8V.text"
        }

        return NSLocalizedString("gor-ep-g8V.text", tableName: "Main", bundle: bundle, comment: "")
      }

      /// uk translation: Button
      ///
      /// Locales: uk
      static func iTYUEUORNormalTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("iTY-uE-UOR.normalTitle", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "iTY-uE-UOR.normalTitle"
        }

        return NSLocalizedString("iTY-uE-UOR.normalTitle", tableName: "Main", bundle: bundle, comment: "")
      }

      /// uk translation: Button
      ///
      /// Locales: uk
      static func lfeR9He5NormalTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Lfe-r9-he5.normalTitle", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "Lfe-r9-he5.normalTitle"
        }

        return NSLocalizedString("Lfe-r9-he5.normalTitle", tableName: "Main", bundle: bundle, comment: "")
      }

      /// uk translation: Calculate
      ///
      /// Locales: uk
      static func lfeR9He5ConfigurationTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Lfe-r9-he5.configuration.title", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "Lfe-r9-he5.configuration.title"
        }

        return NSLocalizedString("Lfe-r9-he5.configuration.title", tableName: "Main", bundle: bundle, comment: "")
      }

      /// uk translation: Clear
      ///
      /// Locales: uk
      static func iTYUEUORConfigurationTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("iTY-uE-UOR.configuration.title", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "iTY-uE-UOR.configuration.title"
        }

        return NSLocalizedString("iTY-uE-UOR.configuration.title", tableName: "Main", bundle: bundle, comment: "")
      }

      /// uk translation: First
      ///
      /// Locales: uk
      static func bzP5gO2eSegmentTitles0(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("bzP-5g-O2e.segmentTitles[0]", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "bzP-5g-O2e.segmentTitles[0]"
        }

        return NSLocalizedString("bzP-5g-O2e.segmentTitles[0]", tableName: "Main", bundle: bundle, comment: "")
      }

      /// uk translation: Height
      ///
      /// Locales: uk
      static func t09QL7gCText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("T09-qL-7gC.text", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "T09-qL-7gC.text"
        }

        return NSLocalizedString("T09-qL-7gC.text", tableName: "Main", bundle: bundle, comment: "")
      }

      /// uk translation: Label
      ///
      /// Locales: uk
      static func c3Kz3WhText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("4C3-Kz-3Wh.text", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "4C3-Kz-3Wh.text"
        }

        return NSLocalizedString("4C3-Kz-3Wh.text", tableName: "Main", bundle: bundle, comment: "")
      }

      /// uk translation: Physical Activity
      ///
      /// Locales: uk
      static func jGWsMNcText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("9jG-ws-mNc.text", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "9jG-ws-mNc.text"
        }

        return NSLocalizedString("9jG-ws-mNc.text", tableName: "Main", bundle: bundle, comment: "")
      }

      /// uk translation: Second
      ///
      /// Locales: uk
      static func bzP5gO2eSegmentTitles1(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("bzP-5g-O2e.segmentTitles[1]", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "bzP-5g-O2e.segmentTitles[1]"
        }

        return NSLocalizedString("bzP-5g-O2e.segmentTitles[1]", tableName: "Main", bundle: bundle, comment: "")
      }

      /// uk translation: Weight
      ///
      /// Locales: uk
      static func zZfGyClRText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("ZZf-gy-clR.text", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "ZZf-gy-clR.text"
        }

        return NSLocalizedString("ZZf-gy-clR.text", tableName: "Main", bundle: bundle, comment: "")
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
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let name = "Main"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
