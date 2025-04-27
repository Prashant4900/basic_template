import 'package:appwrite_app/core/dimensions.dart';
import 'package:appwrite_app/l10n/l10n.dart';
import 'package:appwrite_app/router/router.dart';
import 'package:appwrite_app/views/components/buttons.dart';
import 'package:appwrite_app/views/components/test_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class MyLoginScreen extends StatelessWidget {
  const MyLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              l10n.welcomeBackTitle,
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
                  verticalMargin12,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.push(Routes.forgotPassword),
                      child: Text(
                        l10n.forgotPasswordButtonLabel,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  verticalMargin48,
                  CustomElevatedButton(
                    label: l10n.signinButtonLabel,
                    onPressed: () => context.goAndRemoveAll(Routes.home),
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
                    label: l10n.signinWithGoogleButtonLabel,
                    icon: Brand(Brands.google, size: 24),
                    onPressed: () {},
                  ),
                  verticalMargin16,
                  CustomElevatedButton(
                    label: l10n.signinWithAppleButtonLabel,
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
                        text: '${l10n..dontHaveAccountLabel} ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: l10n.signupLinkLabel,
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () => context.push(Routes.signup),
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
