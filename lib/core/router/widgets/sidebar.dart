import 'package:flutter/material.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:geotas/features/auth/providers/notifier/user_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CollapsibleSidebar extends ConsumerStatefulWidget {
  const CollapsibleSidebar({super.key, required this.user});

  final dynamic user;

  @override
  ConsumerState<CollapsibleSidebar> createState() => _CollapsibleSidebarState();
}

class _CollapsibleSidebarState extends ConsumerState<CollapsibleSidebar>
    with SingleTickerProviderStateMixin {
  bool _collapsed = false;

  late final AnimationController _controller;
  late final Animation<double> _widthAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _widthAnim = Tween<double>(begin: 220, end: 64).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _collapsed = !_collapsed);
    _collapsed ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return AnimatedBuilder(
      animation: _widthAnim,
      builder: (context, _) {
        return SizedBox(
          width: _widthAnim.value,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
                  width: 0.5,
                ),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Brand + toggle
                Row(
                  mainAxisAlignment: _collapsed
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    if (!_collapsed)
                      SvgPicture.asset(
                        'assets/svgs/logo-black.svg',
                        height: 32,
                        fit: BoxFit.contain,
                      ),
                    IconButton(
                      onPressed: _toggle,
                      icon: Icon(
                        _collapsed
                            ? LucideIcons.panelLeftOpen
                            : LucideIcons.panelLeftClose,
                        size: 18,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),

                if (!_collapsed) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Attendance portal',
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.5),
                    ),
                  ),
                ],

                const SizedBox(height: 32),

                _SidebarItem(
                  icon: LucideIcons.layoutDashboard,
                  label: 'Dashboard',
                  active: location == '/dashboard',
                  collapsed: _collapsed,
                  onTap: () => context.go('/dashboard'),
                ),
                _SidebarItem(
                  icon: LucideIcons.book,
                  label: 'My Courses',
                  active: location.startsWith('/courses'),
                  collapsed: _collapsed,
                  onTap: () => context.go('/courses'),
                ),
                _SidebarItem(
                  icon: LucideIcons.calendar,
                  label: 'Sessions',
                  active: location == '/sessions',
                  collapsed: _collapsed,
                  onTap: () => context.go('/sessions'),
                ),
                _SidebarItem(
                  icon: LucideIcons.chartColumn,
                  label: 'Reports',
                  active: location == '/reports',
                  collapsed: _collapsed,
                  onTap: () => context.go('/reports'),
                ),

                const Spacer(),

                // Sign out
                _SidebarItem(
                  icon: LucideIcons.logOut,
                  label: 'Sign out',
                  active: false,
                  collapsed: _collapsed,
                  onTap: () async {
                    await ref.read(secureStorageProvider).deleteToken();
                    ref.read(userProvider.notifier).clear();
                    if (context.mounted) context.go('/login');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.collapsed,
    this.active = false,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool collapsed;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final iconColor = active
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5);

    final item = GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 2),
        padding: EdgeInsets.symmetric(
          horizontal: collapsed ? 0 : 10,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: active
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: collapsed
            ? Center(child: Icon(icon, size: 18, color: iconColor))
            : Row(
                children: [
                  Icon(icon, size: 16, color: iconColor),
                  const SizedBox(width: 10),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight:
                          active ? FontWeight.w500 : FontWeight.normal,
                      color: iconColor,
                    ),
                  ),
                ],
              ),
      ),
    );

    // Show tooltip with label when collapsed
    return collapsed
        ? Tooltip(message: label, child: item)
        : item;
  }
}