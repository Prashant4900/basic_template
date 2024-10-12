import 'package:basic_template/views/dashboard.dart';
import 'package:basic_template/views/screens/account_detail_screen.dart';
import 'package:basic_template/views/screens/home/home_screen.dart';
import 'package:basic_template/views/screens/language/language_screen.dart';
import 'package:basic_template/views/screens/onboarding/onboarding_screen.dart';
import 'package:basic_template/views/screens/registration/registration_screen.dart';
import 'package:basic_template/views/screens/setting/setting_screen.dart';
import 'package:basic_template/views/screens/theme/theme_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
}

final routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  initialLocation: MyRoutes.onboarding,
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
