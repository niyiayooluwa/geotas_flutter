import 'package:flutter/material.dart';
import 'package:geotas/core/utils/date_formatter.dart';
import 'package:geotas/features/auth/data/models/user_model.dart';
import 'package:geotas/features/auth/providers/notifier/user_notifier.dart';
import 'package:geotas/features/courses/presentation/widgets/add_course_sheet.dart';
import 'package:geotas/features/courses/presentation/widgets/course_grid.dart';
import 'package:geotas/features/courses/presentation/widgets/course_list.dart';
import 'package:geotas/features/courses/presentation/widgets/user_avatar.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CoursesScreen extends HookConsumerWidget {
  const CoursesScreen({super.key});

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
        return isDesktop
            ? _DesktopCoursesView(user: user)
            : _MobileCoursesView(user: user);
      },
    );
  }
}

// ─── Desktop ─────────────────────────────────────────────────────────────────

class _DesktopCoursesView extends ConsumerWidget {
  final UserModel? user;
  const _DesktopCoursesView({required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
          child: Row(
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
              ClipOval(
                child: Image.network(
                  user?.avatarUrl ?? '',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => UserAvatar(user: user),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ShadSeparator.horizontal(
          thickness: 0.5,
          color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'My courses',
                      style: Theme.of(context).textTheme.bodyLarge,
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

// ─── Mobile ──────────────────────────────────────────────────────────────────

class _MobileCoursesView extends ConsumerWidget {
  final UserModel? user;
  const _MobileCoursesView({required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => ref.read(courseProvider.notifier).refresh(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good ${greeting()}, ${user?.firstName ?? ''}',
                          style: ShadTheme.of(context).textTheme.h3,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          formattedDate(),
                          style: ShadTheme.of(context).textTheme.muted,
                        ),
                      ],
                    ),
                  ),
                  ClipOval(
                    child: Image.network(
                      user?.avatarUrl ?? '',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => UserAvatar(user: user),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Text(
                    'Enrolled courses',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => showAddCourseSheet(context),
                    child: Text(
                      '+ Add course',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const CourseList(),
            ],
          ),
        ),
      ),
    );
  }
}
