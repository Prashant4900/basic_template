import 'package:appwrite_app/app/app.dart';
import 'package:appwrite_app/bootstrap.dart';
import 'package:appwrite_app/config/app_config.dart';
import 'package:appwrite_app/config/flavor.dart';
import 'package:appwrite_app/core/get_it.dart';
import 'package:appwrite_app/utility/app_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize app configurations
  await AppConfig.init(flavor: Flavor.development);

  // Initialize Splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize ScreenUtil
  await ScreenUtil.ensureScreenSize();

  // Initialize Shared Preferences
  await AppPref.init();

  // Dependency Injection
  setup();

  // Initialize app
  await bootstrap(() => const MyApp());
}
