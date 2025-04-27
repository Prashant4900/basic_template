import 'package:appwrite_app/views/screens/auth/forgot_password_screen.dart';
import 'package:appwrite_app/views/screens/auth/login_screen.dart';
import 'package:appwrite_app/views/screens/auth/signup_screen.dart';
import 'package:appwrite_app/views/screens/home/home_screen.dart';
import 'package:appwrite_app/views/screens/onboarding/onboarding_screen.dart';
import 'package:appwrite_app/views/screens/settings/account_detail_screen.dart';
import 'package:appwrite_app/views/screens/settings/language_screen.dart';
import 'package:appwrite_app/views/screens/settings/setting_screen.dart';
import 'package:appwrite_app/views/screens/settings/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

class Routes {
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const signup = '/signup';
  static const forgotPassword = '/forgotPassword';
  static const setting = '/setting';
  static const accountDeatil = '/accountDeatil';
  static const language = '/language';
  static const theme = '/theme';
  static const home = '/';
}

extension GoRouterX on BuildContext {
  void goAndRemoveAll(String routeName, {Object? extra}) {
    if (canPop()) {
      pop();
    }

    go(routeName, extra: extra);
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.onboarding,
    debugLogDiagnostics: true,
    observers: [PosthogObserver()],

    // Global error page handler
    errorBuilder:
        (context, state) => Scaffold(
          body: Center(child: Text('Page not found: ${state.error}')),
        ),

    // Redirect to login if not authenticated
    redirect: (context, state) async {
      return null;
    },

    // Define routes
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.login,
        builder: (context, state) => const MyLoginScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.signup,
        builder: (context, state) => const MySignupScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.forgotPassword,
        builder: (context, state) => const MyForgotPasswordScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.setting,
        builder: (context, state) => const MySettingScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.onboarding,
        builder: (context, state) => const MyOnboardingScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.home,
        builder: (context, state) => const MyHomeScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.accountDeatil,
        builder: (context, state) => const MyAccountDetailScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.theme,
        builder: (context, state) => const MyThemeScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.language,
        builder: (context, state) => const MyLanguageScreen(),
      ),
    ],
  );
}
