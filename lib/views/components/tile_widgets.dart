import 'package:flutter/material.dart';

class SettingTileWidget extends StatelessWidget {
  const SettingTileWidget({
    required this.title,
    this.subtitle,
    this.trailing,
    this.leading,
    this.leadingIcon,
    this.onTap,
    super.key,
  }) : assert(
          (leading != null) != (leadingIcon != null),
          'Either leading or leadingIcon must be provided, but not both.',
        );

  final Widget? leading;
  final Widget? trailing;
  final IconData? leadingIcon;
  final String title;
  final String? subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: leading ?? Icon(leadingIcon, size: 28),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: trailing,
      subtitle: (subtitle != null)
          ? Text(
              subtitle ?? '',
              style: Theme.of(context).textTheme.bodySmall,
            )
          : null,
    );
  }
}
