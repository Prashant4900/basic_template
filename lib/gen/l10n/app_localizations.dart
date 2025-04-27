import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// Title text shown in the AppBar of the SignUp screen
  ///
  /// In en, this message translates to:
  /// **'Register a new account!'**
  String get registerNewAccountTitle;

  /// Label for selecting the preferred language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// Label for selecting the preferred language
  ///
  /// In en, this message translates to:
  /// **'Select your language'**
  String get selectLanguage;

  /// Label for the Name input field
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameFieldLabel;

  /// Hint text for the Name input field
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get nameFieldHint;

  /// Label for the Email input field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailFieldLabel;

  /// Hint text for the Email input field
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailFieldHint;

  /// Label for the Password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordFieldLabel;

  /// Hint text for the Password input field
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordFieldHint;

  /// Label for the Sign Up button
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signupButtonLabel;

  /// Label between Sign Up options indicating alternative methods
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get orLabel;

  /// Label for the Sign Up with Google button
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get signupWithGoogleButtonLabel;

  /// Label for the Sign Up with Apple button
  ///
  /// In en, this message translates to:
  /// **'Sign up with Apple'**
  String get signupWithAppleButtonLabel;

  /// Label prompting user if they already have an account
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccountLabel;

  /// Clickable Sign In text in Sign Up screen
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signinLinkLabel;

  /// Title text shown in the AppBar of the Login screen
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcomeBackTitle;

  /// Button text for Forgot Password
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPasswordButtonLabel;

  /// Label for the Sign In button
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signinButtonLabel;

  /// Label for the Sign In with Google button
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signinWithGoogleButtonLabel;

  /// Label for the Sign In with Apple button
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get signinWithAppleButtonLabel;

  /// Label prompting user if they don't have an account
  ///
  /// In en, this message translates to:
  /// **'Do not have an account?'**
  String get dontHaveAccountLabel;

  /// Clickable Sign Up text in Login screen
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signupLinkLabel;

  /// Title text shown in the AppBar of the Forgot Password screen
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPasswordTitle;

  /// Instruction text shown below AppBar in Forgot Password screen
  ///
  /// In en, this message translates to:
  /// **'Enter the email address associated with your account and we’ll send you a link to reset your password.'**
  String get forgotPasswordInstruction;

  /// Title text shown in the AppBar of the Settings screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Title for the General section in Settings screen
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsGeneralSection;

  /// Label for Account details SettingTile
  ///
  /// In en, this message translates to:
  /// **'Account details'**
  String get settingsAccountDetails;

  /// Label for Language SettingTile
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// Label for Theme SettingTile
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// Title for the Information section in Settings screen
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get settingsInformationSection;

  /// Label for Rate us SettingTile
  ///
  /// In en, this message translates to:
  /// **'Rate us'**
  String get settingsRateUs;

  /// Label for Privacy policy SettingTile
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get settingsPrivacyPolicy;

  /// Label for Terms and Conditions SettingTile
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions'**
  String get settingsTermsAndConditions;

  /// Label for App Version SettingTile
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingsVersion;

  /// Title for the Other section in Settings screen
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get settingsOtherSection;

  /// Label for Logout SettingTile
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get settingsLogout;

  /// Label for Delete Account SettingTile
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get settingsDeleteAccount;

  /// Title shown in the AppBar of the theme selection screen
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeScreenTitle;

  /// Option to use the system default theme
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefaultLabel;

  /// Option to select light mode
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightModeLabel;

  /// Option to select dark mode
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkModeLabel;

  /// Title shown in the AppBar of the Account Details screen
  ///
  /// In en, this message translates to:
  /// **'Account Details'**
  String get accountDetailsScreenTitle;

  /// Label for the Save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButtonLabel;

  /// Title shown in the AppBar of the Home screen
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeScreenTitle;

  /// Label text shown in the body of the Home screen
  ///
  /// In en, this message translates to:
  /// **'Home Screen'**
  String get homeScreenLabel;

  /// Dynamic Color
  ///
  /// In en, this message translates to:
  /// **'Dynamic Color'**
  String get dynamicColor;

  /// Use dynamic adaptive color
  ///
  /// In en, this message translates to:
  /// **'Use dynamic adaptive color'**
  String get dynamicColorSubTitle;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
