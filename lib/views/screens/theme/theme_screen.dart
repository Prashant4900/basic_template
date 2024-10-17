import 'package:basic_template/common/dimensions.dart';
import 'package:basic_template/l10n/l10n.dart';
import 'package:basic_template/views/components/body_widget.dart';
import 'package:basic_template/views/components/header.dart';
import 'package:basic_template/views/screens/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyThemeScreen extends StatelessWidget {
  const MyThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: headerNav(context, title: context.lang.theme),
          body: BodyWidget(
            child: Column(
              children: [
                verticalMargin12,
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Light'),
                  leading: const Icon(Icons.light_mode),
                  trailing: state.themeMode == ThemeMode.light
                      ? const Icon(Icons.check)
                      : emptyWidget,
                  onTap: () =>
                      context.read<ThemeCubit>().changeTheme(ThemeMode.light),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Dark'),
                  leading: const Icon(Icons.dark_mode),
                  trailing: state.themeMode == ThemeMode.dark
                      ? const Icon(Icons.check)
                      : emptyWidget,
                  onTap: () =>
                      context.read<ThemeCubit>().changeTheme(ThemeMode.dark),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('System'),
                  leading: const Icon(Icons.contrast),
                  trailing: state.themeMode == ThemeMode.system
                      ? const Icon(Icons.check)
                      : emptyWidget,
                  onTap: () =>
                      context.read<ThemeCubit>().changeTheme(ThemeMode.system),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
