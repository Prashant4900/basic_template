import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.hintText});

  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(decoration: InputDecoration(hintText: hintText));
  }
}
