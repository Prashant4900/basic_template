import 'package:appwrite_app/core/dimensions.dart';
import 'package:appwrite_app/core/urls.dart';
import 'package:appwrite_app/l10n/l10n.dart';
import 'package:appwrite_app/router/router.dart';
import 'package:appwrite_app/utility/url_services.dart';
import 'package:appwrite_app/views/components/tiles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MySettingScreen extends StatelessWidget {
  const MySettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              l10n.settingsTitle,
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
                  Text(
                    l10n.settingsGeneralSection,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SettingTile(
                    label: l10n.settingsAccountDetails,
                    icon: const Icon(Icons.person_outline),
                    onPressed: () => context.push(Routes.accountDeatil),
                  ),
                  SettingTile(
                    label: l10n.settingsLanguage,
                    icon: const Icon(AntDesign.global_outline),
                    onPressed: () => context.push(Routes.language),
                  ),
                  SettingTile(
                    label: l10n.settingsTheme,
                    icon: const Icon(Icons.light_mode),
                    onPressed: () => context.push(Routes.theme),
                  ),
                  verticalMargin24,
                  Text(
                    l10n.settingsInformationSection,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SettingTile(
                    label: l10n.settingsRateUs,
                    icon: const Icon(Icons.mail),
                    onPressed: UrlUtility.contactUs,
                  ),
                  SettingTile(
                    label: l10n.settingsPrivacyPolicy,
                    icon: const Icon(Icons.privacy_tip),
                    onPressed: () => UrlUtility.launch(templateUrl),
                  ),
                  SettingTile(
                    label: l10n.settingsTermsAndConditions,
                    icon: const Icon(Icons.description),
                    onPressed: () => UrlUtility.launch(templateUrl),
                  ),
                  FutureBuilder(
                    future: getAppVersion(),
                    builder: (context, snapshot) {
                      return SettingTile(
                        label: l10n.settingsVersion,
                        icon: const Icon(Icons.info),
                        subtitle: snapshot.data,
                      );
                    },
                  ),
                  verticalMargin24,
                  Text(
                    l10n.settingsOtherSection,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SettingTile(
                    label: l10n.settingsLogout,
                    icon: const Icon(Icons.logout, color: Colors.red),
                  ),
                  SettingTile(
                    label: l10n.settingsDeleteAccount,
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<String> getAppVersion() async {
  final packageInfo = await PackageInfo.fromPlatform();

  return packageInfo.version;
}
