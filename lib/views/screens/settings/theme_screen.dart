import 'package:appwrite_app/core/dimensions.dart';
import 'package:appwrite_app/l10n/l10n.dart';
import 'package:appwrite_app/views/screens/settings/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyThemeScreen extends StatelessWidget {
  const MyThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: Text(
                  l10n.themeScreenTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                centerTitle: true,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: horizontalPadding16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          l10n.systemDefaultLabel,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        trailing:
                            state.themeMode == ThemeMode.system
                                ? const Icon(Icons.check)
                                : null,
                        onTap:
                            () => context.read<SettingCubit>().changeTheme(
                              ThemeMode.system,
                            ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          l10n.lightModeLabel,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        trailing:
                            state.themeMode == ThemeMode.light
                                ? const Icon(Icons.check)
                                : null,
                        onTap:
                            () => context.read<SettingCubit>().changeTheme(
                              ThemeMode.light,
                            ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          l10n.darkModeLabel,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        trailing:
                            state.themeMode == ThemeMode.dark
                                ? const Icon(Icons.check)
                                : null,
                        onTap:
                            () => context.read<SettingCubit>().changeTheme(
                              ThemeMode.dark,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
