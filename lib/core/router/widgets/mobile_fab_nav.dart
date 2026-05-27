import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MobileFabNav extends StatelessWidget {
  const MobileFabNav({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showNavSheet(context),
      child: const Icon(LucideIcons.menu),
    );
  }

  void _showNavSheet(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // drag handle
                Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                _NavSheetItem(
                  icon: LucideIcons.layoutDashboard,
                  label: 'Home',
                  active: location == '/dashboard',
                  onTap: () { Navigator.pop(context); context.go('/dashboard'); },
                ),
                _NavSheetItem(
                  icon: LucideIcons.book,
                  label: 'Courses',
                  active: location.startsWith('/courses'),
                  onTap: () { Navigator.pop(context); context.go('/courses'); },
                ),
                _NavSheetItem(
                  icon: LucideIcons.circleUser,
                  label: 'Profile',
                  active: location == '/profile',
                  onTap: () { Navigator.pop(context); context.go('/profile'); },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NavSheetItem extends StatelessWidget {
  const _NavSheetItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.active = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onSurface;

    return ListTile(
      leading: Icon(icon, color: color, size: 20),
      title: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: active ? FontWeight.w600 : FontWeight.normal,
          fontSize: 14,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: active
          ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.08)
          : null,
      onTap: onTap,
    );
  }
}