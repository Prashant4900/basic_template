import 'package:appwrite_app/core/dimensions.dart';
import 'package:appwrite_app/l10n/l10n.dart';
import 'package:appwrite_app/views/screens/settings/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyLanguageScreen extends StatelessWidget {
  const MyLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: Text(
                  context.l10n.languageLabel,
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
                          'English',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        trailing:
                            state.local == 'en'
                                ? const Icon(Icons.check)
                                : null,
                        onTap:
                            () => context.read<SettingCubit>().changeLanguage(
                              'en',
                            ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Español',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        trailing:
                            state.local == 'es'
                                ? const Icon(Icons.check)
                                : null,
                        onTap:
                            () => context.read<SettingCubit>().changeLanguage(
                              'es',
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
