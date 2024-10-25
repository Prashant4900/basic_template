import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_hi.dart';

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
    Locale('es'),
    Locale('hi')
  ];

  /// A hello world message
  ///
  /// In en, this message translates to:
  /// **'Hello, World! English'**
  String get helloWorld;

  /// A app name
  ///
  /// In en, this message translates to:
  /// **'Flutter Basic Template'**
  String get appName;

  /// A greeting message
  ///
  /// In en, this message translates to:
  /// **'Hi'**
  String get hi;

  /// A prompt to select the language
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// Onboarding page 1 title
  ///
  /// In en, this message translates to:
  /// **'Welcome to our freedom \nmessaging app'**
  String get onboardingTitle1;

  /// Onboarding page 1 subtitle
  ///
  /// In en, this message translates to:
  /// **'Freedom talk any person of your \nmother language.'**
  String get onboardingSubtitle1;

  /// Onboarding page 2 title
  ///
  /// In en, this message translates to:
  /// **'Welcome to our freedom \nmessaging app 1'**
  String get onboardingTitle2;

  /// Onboarding page 2 subtitle
  ///
  /// In en, this message translates to:
  /// **'Freedom talk any person of your \nmother language.'**
  String get onboardingSubtitle2;

  /// Onboarding page 3 title
  ///
  /// In en, this message translates to:
  /// **'Welcome to our freedom \nmessaging app 2'**
  String get onboardingTitle3;

  /// Onboarding page 3 subtitle
  ///
  /// In en, this message translates to:
  /// **'Freedom talk any person of your \nmother language.'**
  String get onboardingSubtitle3;

  /// Skip the onboarding
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Go to the previous onboarding page
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// Go to the next onboarding page
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Submit the onboarding
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Title for entering registration details
  ///
  /// In en, this message translates to:
  /// **'Enter Details'**
  String get enterDetails;

  /// Instructions for entering registration details
  ///
  /// In en, this message translates to:
  /// **'Welcome! Please enter your name, email, and phone number to complete your registration and continue to the app.'**
  String get welcomeMessage;

  /// Label for the name input field
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Label for the email input field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Label for the phone number input field
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Error message for empty name field
  ///
  /// In en, this message translates to:
  /// **'Name cannot be empty.'**
  String get nameEmptyError;

  /// Error message for name length validation
  ///
  /// In en, this message translates to:
  /// **'Name must be greater than 3 characters.'**
  String get nameLengthError;

  /// Error message for empty email field
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty.'**
  String get emailEmptyError;

  /// Error message for invalid email address
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get emailInvalidError;

  /// Error message for empty phone number field
  ///
  /// In en, this message translates to:
  /// **'Phone Number cannot be empty.'**
  String get phoneNumberEmptyError;

  /// Link text for Terms of Services
  ///
  /// In en, this message translates to:
  /// **'Terms of Services'**
  String get termsOfService;

  /// Link text for Privacy Policy
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Title for the settings screen
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// Section title for general settings
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// Title for the account details option
  ///
  /// In en, this message translates to:
  /// **'Account details'**
  String get accountDetails;

  /// Title for the theme option
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Title for the language option
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Section title for info settings
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// Title for the rate my app option
  ///
  /// In en, this message translates to:
  /// **'Rate my app'**
  String get rateMyApp;

  /// Title for the privacy policy option
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicyOption;

  /// Title for the terms of service option
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfServiceOption;

  /// Title for the contract option
  ///
  /// In en, this message translates to:
  /// **'Contract'**
  String get contract;

  /// Label for the version information
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Subtitle showing the current version of the app
  ///
  /// In en, this message translates to:
  /// **'1.0.1 (17)'**
  String get versionInfo;

  /// Title for the account detail screen
  ///
  /// In en, this message translates to:
  /// **'Account Detail'**
  String get accountDetail;

  /// Header for updating account details
  ///
  /// In en, this message translates to:
  /// **'Update Details'**
  String get updateDetails;

  /// Message explaining the purpose of the update form
  ///
  /// In en, this message translates to:
  /// **'Update your name, email, and phone number to keep your profile up-to-date and continue using the app.'**
  String get updateProfileMessage;

  /// Label for the update button
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Validation message for empty name field
  ///
  /// In en, this message translates to:
  /// **'Name can not be empty'**
  String get nameCannotBeEmpty;

  /// Validation message for short name
  ///
  /// In en, this message translates to:
  /// **'Name must be greater than 3 characters'**
  String get nameTooShort;

  /// Validation message for empty email field
  ///
  /// In en, this message translates to:
  /// **'Email can not be empty'**
  String get emailCannotBeEmpty;

  /// Validation message for invalid email format
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// Validation message for empty phone number field
  ///
  /// In en, this message translates to:
  /// **'Phone Number can not be empty'**
  String get phoneNumberCannotBeEmpty;

  /// Validation message for incorrect phone number length
  ///
  /// In en, this message translates to:
  /// **'Phone Number must be greater than 8 and less than 15'**
  String get phoneNumberLengthError;

  /// Message indicating agreement to terms
  ///
  /// In en, this message translates to:
  /// **'By purchasing, you agree to our'**
  String get agreeToTerms;

  /// Styled text for Terms of Services link
  ///
  /// In en, this message translates to:
  /// **'Terms of Services'**
  String get termsOfServices;

  /// Conjunction word used in the agreement text
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// Text for home link
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Styled text for Privacy Policy link, indicating the last word
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy.'**
  String get privacyPolicyEnd;

  /// Validation message for an empty name field
  ///
  /// In en, this message translates to:
  /// **'Name can not be empty'**
  String get nameValidationEmpty;

  /// Validation message for name length
  ///
  /// In en, this message translates to:
  /// **'Name must be greater than 3 characters'**
  String get nameValidationLength;

  /// Validation message for an empty email field
  ///
  /// In en, this message translates to:
  /// **'Email can not be empty'**
  String get emailValidationEmpty;

  /// Validation message for invalid email format
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get emailValidationInvalid;

  /// Validation message for an empty phone number field
  ///
  /// In en, this message translates to:
  /// **'Phone Number can not be empty'**
  String get phoneNumberValidationEmpty;

  /// Validation message for phone number length
  ///
  /// In en, this message translates to:
  /// **'Phone Number must be greater than 8 and less than 15 characters'**
  String get phoneNumberValidationLength;

  /// Option for light theme
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// Option for dark theme
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// Option for system theme
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// Option to delete the account
  ///
  /// In en, this message translates to:
  /// **'Delete My Account'**
  String get deleteMyAccount;

  /// Option to log out
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Message displaying the number of times a button has been pressed
  ///
  /// In en, this message translates to:
  /// **'You have pushed the button this many times:'**
  String get buttonPressCount;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'hi': return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
