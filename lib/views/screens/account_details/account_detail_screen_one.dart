import 'package:basic_template/common/dimensions.dart';
import 'package:basic_template/routes/routers.dart';
import 'package:basic_template/services/app_prefs.dart';
import 'package:basic_template/views/components/body_widget.dart';
import 'package:basic_template/views/components/buttons.dart';
import 'package:basic_template/views/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAccountDetailScreenOne extends StatefulWidget {
  const MyAccountDetailScreenOne({super.key});

  @override
  State<MyAccountDetailScreenOne> createState() =>
      _MyAccountDetailScreenOneState();
}

class _MyAccountDetailScreenOneState extends State<MyAccountDetailScreenOne> {
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
      appBar: AppBar(
        title: const Text('Account Detail'),
      ),
      body: BodyWidget(
        formKey: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalMargin20,
            Text(
              'Update Details',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              '''Update your name, email, and phone number to keep your profile up-to-date and continue using the app.''',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            verticalMargin48,
            CustomTextField(
              nameController: _nameController,
              detail: 'Name',
              iconData: Icons.person,
              validation: (value) {
                if (value!.isEmpty) return 'Name can not be empty';
                if (value.length < 3) return 'Name must be greater then 3 char';
                return null;
              },
            ),
            verticalMargin24,
            CustomTextField(
              nameController: _emailController,
              detail: 'Email',
              iconData: Icons.email,
              validation: (value) {
                if (value!.isEmpty) return 'Email can not be empty';
                final emailRegExp = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                );
                if (!emailRegExp.hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            verticalMargin24,
            CustomTextField(
              nameController: _phoneNumberController,
              detail: 'Phone Number',
              iconData: Icons.phone,
              validation: (value) {
                if (value!.isEmpty) return 'Please Number can not be empty';
                if (value.length <= 8 && value.length >= 15) {
                  return 'Phone Number must be greater than 8 and less than 15';
                }
                return null;
              },
            ),
            const Spacer(),
            CustomElevatedButton(
              label: 'Update',
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
          ],
        ),
      ),
    );
  }
}
