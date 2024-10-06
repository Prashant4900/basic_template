import 'package:basic_template/common/dimensions.dart';
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
      appBar: headerNav(context, title: 'Setting'),
      body: BodyWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalMargin16,
            const PrimaryText('General'),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.person, size: 28),
              onTap: () => context.push(MyRoutes.accountDetail),
              title: Text(
                'Account details',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.light_mode, size: 28),
              onTap: () => context.push(MyRoutes.theme),
              title: Text(
                'Theme',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () => context.push(MyRoutes.language),
              leading: const GreyIcon(Icons.translate, size: 28),
              title: Text(
                'Language',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            verticalMargin16,
            const PrimaryText('Info'),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.rate_review, size: 28),
              title: Text(
                'Rate my app',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.privacy_tip, size: 28),
              title: Text(
                'Privacy policy',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.verified_user_rounded, size: 28),
              title: Text(
                'Terms of Service',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.mail, size: 28),
              title: Text(
                'Contract',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const GreyIcon(Icons.info_outline, size: 28),
              title:
                  Text('Version', style: Theme.of(context).textTheme.bodyLarge),
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
