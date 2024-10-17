import 'package:basic_template/common/dimensions.dart';
import 'package:basic_template/l10n/l10n.dart';
import 'package:basic_template/routes/routers.dart';
import 'package:basic_template/views/components/body_widget.dart';
import 'package:basic_template/views/components/header.dart';
import 'package:basic_template/views/components/text_widgets.dart';
import 'package:basic_template/views/components/tile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MySettingScreen extends StatelessWidget {
  const MySettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(context, title: context.lang.setting),
      body: BodyWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalMargin16,
            PrimaryText(context.lang.general),
            SettingTileWidget(
              title: context.lang.accountDetail,
              leadingIcon: Icons.person,
              onTap: () => context.push(MyRoutes.accountDetail),
            ),
            SettingTileWidget(
              title: context.lang.theme,
              leadingIcon: Icons.light_mode,
              onTap: () => context.push(MyRoutes.theme),
            ),
            SettingTileWidget(
              title: context.lang.language,
              leadingIcon: Icons.translate,
              onTap: () => context.push(MyRoutes.language),
            ),
            verticalMargin16,
            PrimaryText(context.lang.info),
            SettingTileWidget(
              title: context.lang.rateMyApp,
              leadingIcon: Icons.mail,
            ),
            SettingTileWidget(
              title: context.lang.privacyPolicy,
              leadingIcon: Icons.privacy_tip,
            ),
            SettingTileWidget(
              title: context.lang.termsOfService,
              leadingIcon: Icons.verified_user_rounded,
            ),
            SettingTileWidget(
              title: context.lang.contract,
              leadingIcon: Icons.mail,
            ),
            SettingTileWidget(
              title: context.lang.version,
              leadingIcon: Icons.info_outline,
              subtitle: '1.0.1 (17)',
              onTap: () => context.push(MyRoutes.license),
            ),
          ],
        ),
      ),
    );
  }
}
