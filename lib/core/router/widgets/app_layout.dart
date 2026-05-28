import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:geotas/core/router/widgets/mobile_fab_nav.dart';
import 'package:geotas/core/router/widgets/sidebar.dart';
import 'package:geotas/core/services/permission_gate.dart';
import 'package:geotas/features/auth/providers/notifier/user_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppLayout extends HookConsumerWidget {
  final Widget child;

  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);
    final user = userAsync.when(
      data: (u) => u,
      loading: () => null,
      error: (_, _) => null,
    );

    return ShadResponsiveBuilder(
      builder: (context, breakpoint) {
        final isDesktop = breakpoint >= ShadTheme.of(context).breakpoints.md;

        if (isDesktop) {
          return Scaffold(
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CollapsibleSidebar(user: user),
                Expanded(child: child),
              ],
            ),
          );
        }

        // Mobile — wrap with PermissionGate so permissions are checked once
        return Scaffold(
          body: kIsWeb ? child : PermissionGate(child: child),
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: const MobileFabNav(),
        );
      },
    );
  }
}
