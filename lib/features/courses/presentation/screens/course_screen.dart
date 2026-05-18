import 'package:flutter/material.dart';
import 'package:geotas/features/courses/presentation/screens/views/desktop_dashboard_view.dart';
import 'package:geotas/features/courses/presentation/screens/views/mobile_dashboard_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          final isDesktop = breakpoint >= ShadTheme.of(context).breakpoints.md;
          return isDesktop
              ? const DesktopDashboardView()
              : const MobileDashboardView();
        },
      ),
    );
  }
}
