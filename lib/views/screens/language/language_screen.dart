import 'package:basic_template/common/dimensions.dart';
import 'package:basic_template/l10n/l10n.dart';
import 'package:basic_template/views/components/header.dart';
import 'package:basic_template/views/screens/language/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyLanguageScreen extends StatelessWidget {
  const MyLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: headerNav(context, title: context.lang.selectLanguage),
          body: ListView(
            children: [
              ListTile(
                title: const Text('English'),
                trailing: state.locale == const Locale('en')
                    ? const Icon(Icons.check)
                    : emptyWidget,
                onTap: () => context.read<LanguageCubit>().changeLanguage('en'),
              ),
              ListTile(
                title: const Text('Española'),
                trailing: state.locale == const Locale('es')
                    ? const Icon(Icons.check)
                    : emptyWidget,
                onTap: () => context.read<LanguageCubit>().changeLanguage('es'),
              ),
              ListTile(
                title: const Text('हिंदी'),
                trailing: state.locale == const Locale('hi')
                    ? const Icon(Icons.check)
                    : emptyWidget,
                onTap: () => context.read<LanguageCubit>().changeLanguage('hi'),
              ),
            ],
          ),
        );
      },
    );
  }
}
