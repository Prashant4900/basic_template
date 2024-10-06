import 'package:basic_template/gen/l10n/app_localizations.dart';
import 'package:basic_template/routes/routers.dart';
import 'package:basic_template/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // Remove Splash Screen
    FlutterNativeSplash.remove();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      builder: (context, _) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: lightTheme(context),
          darkTheme: darkTheme(context),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          routerConfig: routerConfig,
          supportedLocales: const [
            Locale('en'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
