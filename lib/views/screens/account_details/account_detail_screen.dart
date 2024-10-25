import 'package:basic_template/l10n/l10n.dart';
import 'package:basic_template/routes/routers.dart';
import 'package:basic_template/services/app_prefs.dart';
import 'package:basic_template/views/components/body_widget.dart';
import 'package:basic_template/views/components/header.dart';
import 'package:basic_template/views/components/tile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAccountDetailScreen extends StatelessWidget {
  const MyAccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(context, title: context.lang.accountDetail),
      body: BodyWidget(
        child: Column(
          children: [
            SettingTileWidget(
              title: context.lang.updateDetails,
              leadingIcon: Icons.person,
              onTap: () => context.push(MyRoutes.updateDetail),
            ),
            SettingTileWidget(
              title: context.lang.logout,
              leadingIcon: Icons.logout,
              onTap: () async {
                await AppPref.remove(AppPrefKey.displayName).whenComplete(() {
                  if (!context.mounted) return;
                  context.pushReplacement(MyRoutes.registration);
                });
              },
            ),
            SettingTileWidget(
              title: context.lang.deleteMyAccount,
              leadingIcon: Icons.delete_forever,
              onTap: () async {
                await AppPref.remove(AppPrefKey.displayName).whenComplete(() {
                  if (!context.mounted) return;
                  context.pushReplacement(MyRoutes.registration);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
