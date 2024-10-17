import 'package:basic_template/routes/routers.dart';
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
      appBar: headerNav(context, title: 'Account Detail'),
      body: BodyWidget(
        child: Column(
          children: [
            SettingTileWidget(
              title: 'Update Details',
              leadingIcon: Icons.person,
              onTap: () => context.push(MyRoutes.updateDetail),
            ),
            SettingTileWidget(
              title: 'Logout',
              leadingIcon: Icons.logout,
              onTap: () => context.pushAndRemoveAll(MyRoutes.registration),
            ),
            SettingTileWidget(
              title: 'Delete My Account',
              leadingIcon: Icons.delete_forever,
              onTap: () => context.pushAndRemoveAll(MyRoutes.registration),
            ),
          ],
        ),
      ),
    );
  }
}
