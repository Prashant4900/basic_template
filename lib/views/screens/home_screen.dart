import 'package:basic_template/l10n/l10n.dart';
import 'package:basic_template/views/components/body_widget.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWidget(
        child: Text(context.lang.helloWorld),
      ),
    );
  }
}
