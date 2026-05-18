import 'package:flutter/material.dart';
import 'package:geotas/core/router/widgets/bottom_nav.dart';
import 'package:geotas/features/auth/providers/notifier/user_notifier.dart';
import 'package:geotas/features/courses/presentation/widgets/add_course_sheet.dart';
import 'package:geotas/features/courses/presentation/widgets/course_list.dart';
import 'package:geotas/features/courses/presentation/widgets/user_avatar.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MobileDashboardView extends HookConsumerWidget {
  const MobileDashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);
    final user = userAsync.when(
      data: (u) => u,
      loading: () => null,
      error: (_, _) => null,
    );

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => ref.read(courseProvider.notifier).refresh(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, ${user?.firstName ?? ''} 👋',
                                style: ShadTheme.of(context).textTheme.h3,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Your courses this semester',
                                style: ShadTheme.of(context).textTheme.muted,
                              ),
                            ],
                          ),
                        ),
                        UserAvatar(user: user),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Courses header
                    Row(
                      children: [
                        const Text(
                          'Enrolled courses',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
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
          ),

          // Bottom nav
          const BottomNav(),
        ],
      ),
    );
  }
}
