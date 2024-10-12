import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.nameController,
    required this.detail,
    required this.validation,
    required this.iconData,
    super.key,
  });

  final TextEditingController nameController;
  final String detail;
  final FormFieldValidator<String> validation;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
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