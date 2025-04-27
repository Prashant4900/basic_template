import 'package:appwrite_app/config/app_config.dart';
import 'package:appwrite_app/gen/l10n/app_localizations.dart';
import 'package:appwrite_app/router/router.dart';
import 'package:appwrite_app/theme/themes.dart';
import 'package:appwrite_app/views/screens/settings/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _router = router();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SettingCubit())],
      child: ScreenUtilInit(
        designSize: const Size(402, 874),
        minTextAdapt: true,
        ensureScreenSize: true,
        useInheritedMediaQuery: true,
        builder: (context, _) {
          return BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
              return MaterialApp.router(
                title: 'Flutter Basic Template',
                theme: lightTheme(context),
                darkTheme: darkTheme(context),
                themeMode: state.themeMode,
                debugShowCheckedModeBanner: AppConfig.instance.isDebug,
                locale: Locale(state.local),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: _router,
              );
            },
          );
        },
      ),
    );
  }
}
