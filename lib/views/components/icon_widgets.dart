import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryIcon extends StatelessWidget {
  const PrimaryIcon(
    this.icon, {
    super.key,
    this.size,
    this.isEnable = true,
  });

  final IconData icon;
  final double? size;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size ?? 32.dm,
      color: isEnable
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.primaryContainer,
    );
  }
}

class GreyIcon extends StatelessWidget {
  const GreyIcon(
    this.icon, {
    super.key,
    this.size,
  });

  final IconData icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size ?? 32.dm,
      color: const Color(0xFFA8A8A8),
    );
  }
}
