import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.user});

  final dynamic user;

  @override
  Widget build(BuildContext context) {
    final initials = user != null
        ? '${user.firstName[0]}${user.lastName[0]}'.toUpperCase()
        : '?';
    final theme = ShadTheme.of(context);

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: theme.colorScheme.muted,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
