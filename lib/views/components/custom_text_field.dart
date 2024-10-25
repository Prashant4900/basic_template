import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.validation,
    required this.iconData,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String> validation;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validation,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        prefixIcon: Icon(iconData),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.dm),
        ),
      ),
    );
  }
}
