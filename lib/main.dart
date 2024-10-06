import 'dart:async';

import 'package:basic_template/app/app.dart';
import 'package:basic_template/services/app_logger.dart';
import 'package:basic_template/services/app_prefs.dart';
import 'package:basic_template/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      // Initialize Splash Screen
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      // Initialize ScreenUtil
      await ScreenUtil.ensureScreenSize();

      // Initialize Shared Preferences
      await AppPref.init();

      // Initialize AppLogger
      await AppLogger.init();

      // Initialize Dependency Injector
      setup();

      runApp(const MyApp());
    },
    catchUnhandledExceptions,
  );
}

void catchUnhandledExceptions(Object error, StackTrace? stack) {
  debugPrintStack(stackTrace: stack, label: error.toString());
}
