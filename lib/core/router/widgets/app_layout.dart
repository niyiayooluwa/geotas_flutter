import 'package:flutter/material.dart';
import 'package:geotas/core/router/widgets/bottom_nav.dart';
import 'package:geotas/core/router/widgets/sidebar.dart';
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

    return Scaffold(
      body: ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          final isDesktop = breakpoint >= ShadTheme.of(context).breakpoints.md;

          if (isDesktop) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 220, child: Sidebar(user: user)),
                Expanded(child: child),
              ],
            );
          }

          return Column(
            children: [
              Expanded(child: child),
              const BottomNav(),
            ],
          );
        },
      ),
    );
  }
}
