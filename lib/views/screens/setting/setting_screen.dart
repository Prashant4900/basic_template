import 'package:basic_template/common/dimensions.dart';
import 'package:basic_template/l10n/l10n.dart';
import 'package:basic_template/routes/routers.dart';
import 'package:basic_template/views/components/body_widget.dart';
import 'package:basic_template/views/components/header.dart';
import 'package:basic_template/views/components/icon_widgets.dart';
import 'package:basic_template/views/components/text_widgets.dart';
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
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.person, size: 28),
              onTap: () => context.push(MyRoutes.accountDetail),
              title: Text(
                context.lang.accountDetail,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.light_mode, size: 28),
              onTap: () => context.push(MyRoutes.theme),
              title: Text(
                context.lang.theme,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () => context.push(MyRoutes.language),
              leading: const GreyIcon(Icons.translate, size: 28),
              title: Text(
                context.lang.language,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            verticalMargin16,
            PrimaryText(context.lang.info),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.rate_review, size: 28),
              title: Text(
                context.lang.rateMyApp,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.privacy_tip, size: 28),
              title: Text(
                context.lang.privacyPolicy,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.verified_user_rounded, size: 28),
              title: Text(
                context.lang.termsOfService,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.mail, size: 28),
              title: Text(
                context.lang.contract,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.info_outline, size: 28),
              title: Text(
                context.lang.version,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                '1.0.1 (17)',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
