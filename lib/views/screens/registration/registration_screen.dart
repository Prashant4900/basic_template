import 'package:basic_template/common/dimensions.dart';
import 'package:basic_template/routes/routers.dart';
import 'package:basic_template/services/app_logger.dart';
import 'package:basic_template/services/app_prefs.dart';
import 'package:basic_template/views/components/body_widget.dart';
import 'package:basic_template/views/components/buttons.dart';
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

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
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
              'Enter name',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              '''Lorem Ipsum is simply dummy text of the printing and typesetting industry.''',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              validator: (value) {
                if (value!.isEmpty) return 'Please enter your name';
                if (value.length < 3) return 'Name must be greater then 3 char';

                return null;
              },
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(hintText: 'Enter name'),
            ),
            verticalMargin48,
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
            const Spacer(),
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
