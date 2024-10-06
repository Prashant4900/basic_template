import 'package:flutter/material.dart';

AppBar headerNav(BuildContext context, {String? title}) {
  return AppBar(
    title: Text(title ?? ''),
    foregroundColor: Theme.of(context).colorScheme.primary,
    centerTitle: false,
  );
}
