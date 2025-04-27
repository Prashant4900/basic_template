import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    required this.label,
    required this.icon,
    this.subtitle,
    super.key,
    this.onPressed,
  });

  final String label;
  final String? subtitle;
  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(label),
      subtitle: subtitle == null ? null : Text(subtitle ?? ''),
      leading: icon,
      contentPadding: EdgeInsets.zero,
      trailing: const Icon(Icons.chevron_right, size: 16),
    );
  }
}
