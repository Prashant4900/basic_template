import 'package:basic_template/common/dimensions.dart';
import 'package:basic_template/services/app_prefs.dart';
import 'package:basic_template/views/components/body_widget.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, ${AppPrefHelper.getDisplayName()}'),
        centerTitle: false,
      ),
      body: BodyWidget(
        child: Column(
          children: [
            verticalMargin20,
          ],
        ),
      ),
    );
  }
}
