import 'package:appwrite_app/core/dimensions.dart';
import 'package:appwrite_app/l10n/l10n.dart';
import 'package:appwrite_app/views/components/buttons.dart';
import 'package:appwrite_app/views/components/test_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class MySignupScreen extends StatelessWidget {
  const MySignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              l10n.registerNewAccountTitle,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
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
                  verticalMargin20,
                  Text(
                    l10n.passwordFieldLabel,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomTextField(hintText: l10n.passwordFieldHint),
                  verticalMargin48,
                  CustomElevatedButton(
                    label: l10n.signupButtonLabel,
                    onPressed: () {},
                  ),
                  verticalMargin16,
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      horizontalMargin8,
                      Text(l10n.orLabel),
                      horizontalMargin8,
                      const Expanded(child: Divider()),
                    ],
                  ),
                  verticalMargin16,
                  CustomElevatedButton(
                    label: l10n.signupWithGoogleButtonLabel,
                    icon: Brand(Brands.google, size: 24),
                    onPressed: () {},
                  ),
                  verticalMargin16,
                  CustomElevatedButton(
                    label: l10n.signupWithAppleButtonLabel,
                    icon: const Icon(Icons.apple, size: 24),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    onPressed: () {},
                  ),
                  verticalMargin48,
                  Align(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '${l10n.alreadyHaveAccountLabel} ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: l10n.signinLinkLabel,
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () => context.pop(),
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
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
