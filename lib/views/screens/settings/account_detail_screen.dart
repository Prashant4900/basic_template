import 'package:appwrite_app/core/dimensions.dart';
import 'package:appwrite_app/l10n/l10n.dart';
import 'package:appwrite_app/views/components/buttons.dart';
import 'package:appwrite_app/views/components/test_fields.dart';
import 'package:flutter/material.dart';

class MyAccountDetailScreen extends StatelessWidget {
  const MyAccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              l10n.accountDetailsScreenTitle,
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
                    l10n.nameFieldLabel,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomTextField(hintText: l10n.nameFieldHint),
                  verticalMargin20,
                  Text(
                    l10n.emailFieldLabel,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomTextField(hintText: l10n.emailFieldHint),
                  verticalMargin48 + verticalMargin16,
                  CustomElevatedButton(
                    label: l10n.saveButtonLabel,
                    onPressed: () {},
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
