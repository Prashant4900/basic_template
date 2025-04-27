import 'package:appwrite_app/app/app.dart';
import 'package:appwrite_app/bootstrap.dart';
import 'package:appwrite_app/config/app_config.dart';
import 'package:appwrite_app/config/flavor.dart';
import 'package:appwrite_app/utility/app_logger.dart';
import 'package:appwrite_app/utility/app_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize app configurations
  await AppConfig.init(flavor: Flavor.staging);

  // Initialize Splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize ScreenUtil
  await ScreenUtil.ensureScreenSize();

  // Initialize Shared Preferences
  await AppPref.init();

  // Initialize AppLogger
  await AppLogger.init();

  // Initialize app
  await bootstrap(() => const MyApp());
}
