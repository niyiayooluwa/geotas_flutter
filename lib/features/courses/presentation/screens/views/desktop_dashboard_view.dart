import 'package:flutter/material.dart';
import 'package:geotas/core/router/widgets/sidebar.dart';
import 'package:geotas/core/utils/date_formatter.dart';
import 'package:geotas/features/auth/providers/notifier/user_notifier.dart';
import 'package:geotas/features/courses/presentation/widgets/course_grid.dart';
import 'package:geotas/features/courses/presentation/widgets/user_avatar.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DesktopDashboardView extends HookConsumerWidget {
  const DesktopDashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);
    final user = userAsync.when(
      data: (u) => u,
      loading: () => null,
      error: (_, _) => null,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sidebar
        SizedBox(width: 220, child: Sidebar(user: user)),

        // Main content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top bar
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good ${greeting()}, ${user?.firstName ?? ''}',
                            style: ShadTheme.of(context).textTheme.h2,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            formattedDate(),
                            style: ShadTheme.of(context).textTheme.muted,
                          ),
                        ],
                      ),
                    ),
                    // Avatar
                    UserAvatar(user: user),
                  ],
                ),
                const SizedBox(height: 32),

                // Courses section
                Row(
                  children: [
                    const Text(
                      'My courses',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () =>
                          ref.read(courseProvider.notifier).refresh(),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Refresh',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                const CourseGrid(isDesktop: true),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
