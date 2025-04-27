import 'package:appwrite_app/config/app_config.dart';
import 'package:appwrite_app/config/env_config.dart';
import 'package:appwrite_app/l10n/l10n.dart';
import 'package:appwrite_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(l10n.homeScreenTitle),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.push(Routes.setting),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          '${l10n.homeScreenLabel}: ${AppConfig.env.get(EnvKey.env)}',
        ),
      ),
    );
  }
}
