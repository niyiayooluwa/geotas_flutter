import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MobileFabNav extends StatelessWidget {
  const MobileFabNav({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return ExpandableFab(
      type: ExpandableFabType.up,
      distance: 64,
      overlayStyle: ExpandableFabOverlayStyle(
        color: Colors.black.withValues(alpha: 0.4),
      ),
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(LucideIcons.menu),
        fabSize: ExpandableFabSize.regular,
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(LucideIcons.x),
        fabSize: ExpandableFabSize.small,
      ),
      children: [

        _FabItem(
          icon: LucideIcons.circleUser,
          label: 'Profile',
          active: location == '/profile',
          onTap: () => context.go('/profile'),
        ),
        _FabItem(
          icon: LucideIcons.book,
          label: 'Courses',
          active: location.startsWith('/courses'),
          onTap: () => context.go('/courses'),
        ),
      ],
    );
  }
}

class _FabItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _FabItem({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: active ? FontWeight.w600 : FontWeight.normal,
              color: active
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(width: 12),
        FloatingActionButton.small(
          heroTag: label,
          onPressed: onTap,
          backgroundColor: active
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          foregroundColor: active
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSurface,
          child: Icon(icon, size: 18),
        ),
      ],
    );
  }
}
