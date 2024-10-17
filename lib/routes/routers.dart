import 'package:basic_template/l10n/l10n.dart';
import 'package:basic_template/services/app_prefs.dart';
import 'package:basic_template/views/dashboard.dart';
import 'package:basic_template/views/screens/account_details/account_detail_screen.dart';
import 'package:basic_template/views/screens/account_details/update_detail_screen.dart';
import 'package:basic_template/views/screens/home/home_screen.dart';
import 'package:basic_template/views/screens/language/language_screen.dart';
import 'package:basic_template/views/screens/onboarding/onboarding_screen.dart';
import 'package:basic_template/views/screens/registration/registration_screen.dart';
import 'package:basic_template/views/screens/setting/setting_screen.dart';
import 'package:basic_template/views/screens/theme/theme_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'route_extensions.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class MyRoutes {
  static const home = '/';
  static const setting = '/setting';
  static const language = '/language';
  static const theme = '/theme';
  static const accountDetail = '/accountDetail';
  static const onboarding = '/onboarding';
  static const registration = '/registration';
  static const license = '/license';
  static const updateDetail = '/updateDetail';
}

final routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  initialLocation: AppPrefHelper.getDisplayName().isEmpty
      ? MyRoutes.onboarding
      : MyRoutes.home,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.registration,
      builder: (context, state) => const MyRegistrationScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.onboarding,
      builder: (context, state) => const MyOnboardingScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.language,
      builder: (context, state) => const MyLanguageScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.theme,
      builder: (context, state) => const MyThemeScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.accountDetail,
      builder: (context, state) => const MyAccountDetailScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.updateDetail,
      builder: (context, state) => const MyUpdateDetailScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.license,
      builder: (context, state) => LicensePage(
        applicationName: context.lang.appName,
      ),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MyDashboard(child: child),
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: MyRoutes.home,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MyHomeScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: MyRoutes.setting,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MySettingScreen()),
        ),
      ],
    ),
  ],
);
