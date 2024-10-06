import 'package:basic_template/common/dimensions.dart';
import 'package:basic_template/routes/routers.dart';
import 'package:basic_template/services/app_logger.dart';
import 'package:basic_template/services/app_prefs.dart';
import 'package:basic_template/views/components/body_widget.dart';
import 'package:basic_template/views/components/buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              'Enter Details',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              '''Welcome! Please enter your name, email, and phone number to complete your registration and continue to the app.''',
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
                if (!emailRegExp.hasMatch(value))
                  return 'Please enter a valid email address';
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
                if (value.length >= 8 && value.length <= 15)
                  return 'Phone Number must be greater than 8 and less than 15';
                return null;
              },
            ),
            const Spacer(),
            CustomElevatedButton(
              label: 'Submit',
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
                  const TextSpan(
                    text: 'By purchasing, you agree to our ',
                  ),
                  TextSpan(
                    text: 'Terms of Services',
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppLogger.info('Terms of Services');
                      },
                  ),
                  const TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy.',
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required TextEditingController nameController,
    required this.detail,
    required this.validation,
    required this.iconData,
    super.key,
  }) : _nameController = nameController;

  final TextEditingController _nameController;
  final String detail;
  final FormFieldValidator<String> validation;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      validator: validation,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        prefixIcon: Icon(iconData),
        hintText: detail,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      ),
    );
  }
}
