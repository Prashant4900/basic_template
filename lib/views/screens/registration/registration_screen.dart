import 'package:basic_template/common/dimensions.dart';
import 'package:basic_template/l10n/l10n.dart';
import 'package:basic_template/routes/routers.dart';
import 'package:basic_template/services/app_logger.dart';
import 'package:basic_template/services/app_prefs.dart';
import 'package:basic_template/views/components/body_widget.dart';
import 'package:basic_template/views/components/buttons.dart';
import 'package:basic_template/views/components/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRegistrationScreen extends StatefulWidget {
  const MyRegistrationScreen({super.key});

  @override
  State<MyRegistrationScreen> createState() => _MyRegistrationScreenState();
}

class _MyRegistrationScreenState extends State<MyRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWidget(
        formKey: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalMargin20,
            Text(
              context.lang.enterDetails,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              context.lang.welcomeMessage,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            verticalMargin48,
            CustomTextField(
              nameController: _nameController,
              detail: context.lang.name,
              iconData: Icons.person,
              validation: (value) {
                if (value!.isEmpty) return context.lang.nameCannotBeEmpty;
                if (value.length < 3) return context.lang.nameLengthError;
                return null;
              },
            ),
            verticalMargin24,
            CustomTextField(
              nameController: _emailController,
              detail: context.lang.email,
              iconData: Icons.email,
              validation: (value) {
                if (value!.isEmpty) return context.lang.emailEmptyError;
                final emailRegExp = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                );
                if (!emailRegExp.hasMatch(value)) {
                  return context.lang.emailValidationInvalid;
                }
                return null;
              },
            ),
            verticalMargin24,
            CustomTextField(
              nameController: _phoneNumberController,
              detail: context.lang.phoneNumber,
              iconData: Icons.phone,
              validation: (value) {
                if (value!.isEmpty) {
                  return context.lang.phoneNumberCannotBeEmpty;
                }
                if (value.length <= 8 && value.length >= 15) {
                  return context.lang.phoneNumberLengthError;
                }
                return null;
              },
            ),
            const Spacer(),
            CustomElevatedButton(
              label: context.lang.submit,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await AppPrefHelper.setDisplayName(
                    displayName: _nameController.text,
                  ).whenComplete(() {
                    if (!context.mounted) return;
                    context.pushReplacement(MyRoutes.home);
                  });
                }
              },
            ),
            verticalMargin12,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall,
                children: [
                  TextSpan(
                    text: '${context.lang.agreeToTerms} ',
                  ),
                  TextSpan(
                    text: context.lang.termsOfService,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppLogger.info('Terms of Services');
                      },
                  ),
                  TextSpan(text: ' ${context.lang.and} '),
                  TextSpan(
                    text: context.lang.privacyPolicyEnd,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppLogger.info('Privacy Policy');
                      },
                  ),
                ],
              ),
            ),
            verticalMargin16,
          ],
        ),
      ),
    );
  }
}
