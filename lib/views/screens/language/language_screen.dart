import 'package:basic_template/l10n/l10n.dart';
import 'package:basic_template/views/components/header.dart';
import 'package:basic_template/views/screens/language/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyLanguageScreen extends StatelessWidget {
  const MyLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(context, title: context.lang.selectLanguage),
      body: ListView(
        children: [
          ListTile(
            title: const Text('English'),
            onTap: () => context.read<LanguageCubit>().changeLanguage('en'),
          ),
          ListTile(
            title: const Text('Spanish'),
            onTap: () => context.read<LanguageCubit>().changeLanguage('es'),
          ),
          ListTile(
            title: const Text('Hindi'),
            onTap: () => context.read<LanguageCubit>().changeLanguage('hi'),
          ),
        ],
      ),
    );
  }
}
