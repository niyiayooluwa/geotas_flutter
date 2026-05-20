import 'package:flutter/material.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:geotas/features/auth/providers/notifier/user_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Sidebar extends ConsumerWidget {
  const Sidebar({super.key, required this.user});

  final dynamic user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.toString();

    final isCurrentThemeDark =
        MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    final logo = isCurrentThemeDark
        ? 'assets/svgs/logo-white.svg'
        : 'assets/svgs/logo-black.svg';

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Brand
          SvgPicture.asset(logo, fit: BoxFit.contain, height: 40),
          const SizedBox(height: 4),
          Text(
            'Attendance portal',
            style: TextStyle(
              fontSize: 11,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 32),

          // Nav items
          _SidebarItem(
            icon: LucideIcons.layoutDashboard,
            label: 'Dashboard',
            active: location == '/dashboard',
            onTap: () => context.go('/dashboard'),
          ),
          _SidebarItem(
            icon: LucideIcons.book,
            label: 'My Courses',
            active: location.startsWith('/courses'),
            onTap: () => context.go('/courses'),
          ),
          _SidebarItem(
            icon: LucideIcons.calendar,
            label: 'Sessions',
            active: location == '/sessions',
            onTap: () => context.go('/sessions'),
          ),
          _SidebarItem(
            icon: LucideIcons.chartColumn,
            label: 'Reports',
            active: location == '/reports',
            onTap: () => context.go('/reports'),
          ),

          const Spacer(),

          _SidebarItem(
            icon: LucideIcons.settings,
            label: 'Settings',
            active: location == '/settings',
            onTap: () => context.go('/settings'),
          ),

          // Sign out
          GestureDetector(
            onTap: () async {
              await ref.read(secureStorageProvider).deleteToken();
              ref.read(userProvider.notifier).clear();
              if (context.mounted) context.go('/login');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  const Icon(LucideIcons.logOut, size: 16),
                  const SizedBox(width: 10),
                  Text(
                    'Sign out',
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.icon,
    required this.label,
    this.active = false,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 2),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: active
              ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.06)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: active
                  ? Theme.of(context).colorScheme.onSurface
                  : Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: active ? FontWeight.w500 : FontWeight.normal,
                color: active
                    ? Theme.of(context).colorScheme.onSurface
                    : Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
