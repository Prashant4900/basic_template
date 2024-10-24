import 'package:basic_template/l10n/l10n.dart';
import 'package:basic_template/views/components/header.dart';
import 'package:flutter/material.dart';

class MyUpdateDetailScreen extends StatelessWidget {
  const MyUpdateDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(context, title: context.lang.updateDetails),
    );
  }
}
