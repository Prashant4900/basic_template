import 'package:basic_template/common/dimensions.dart';
import 'package:basic_template/l10n/l10n.dart';
import 'package:basic_template/services/app_prefs.dart';
import 'package:basic_template/utility/regex.dart';
import 'package:basic_template/views/components/body_widget.dart';
import 'package:basic_template/views/components/buttons.dart';
import 'package:basic_template/views/components/custom_text_field.dart';
import 'package:basic_template/views/components/header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyUpdateDetailScreen extends StatefulWidget {
  const MyUpdateDetailScreen({super.key});

  @override
  State<MyUpdateDetailScreen> createState() => _MyUpdateDetailScreenState();
}

class _MyUpdateDetailScreenState extends State<MyUpdateDetailScreen> {
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
      appBar: headerNav(
        context,
        title: context.lang.updateDetails,
      ),
      body: BodyWidget(
        formKey: _formKey,
        child: Column(
          children: [
            Text(context.lang.updateProfileMessage),
            verticalMargin48,
            CustomTextField(
              controller: _nameController,
              hintText: context.lang.name,
              iconData: Icons.person,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return context.lang.nameCannotBeEmpty;
                }

                if (value.length < 3) return context.lang.nameLengthError;

                return null;
              },
            ),
            verticalMargin16,
            CustomTextField(
              controller: _emailController,
              hintText: context.lang.email,
              iconData: Icons.email,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return context.lang.emailEmptyError;
                }

                final emailRegExp = RegExp(MyRegex.emailRegex);
                if (!emailRegExp.hasMatch(value)) {
                  return context.lang.emailValidationInvalid;
                }

                return null;
              },
            ),
            verticalMargin16,
            CustomTextField(
              controller: _phoneNumberController,
              hintText: context.lang.phoneNumber,
              iconData: Icons.phone,
              validation: (value) {
                if (value == null || value.isEmpty) {
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
                    context.pop();
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
